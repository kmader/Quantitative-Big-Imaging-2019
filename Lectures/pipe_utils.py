from sklearn.preprocessing import FunctionTransformer
import numpy as np
from skimage.filters import laplace, gaussian, median
from skimage.util import montage as montage2d
import matplotlib.pyplot as plt



def display_data(in_ax, raw_data, show_hist):
    if (raw_data.shape[0] == 1) and (len(raw_data.shape) == 4):
        # reformat channels first
        in_data = raw_data[0].swapaxes(0, 2).swapaxes(1, 2)
    else:
        in_data = np.squeeze(raw_data)
    if len(in_data.shape) == 1:
        if show_hist:
            in_ax.hist(in_data)
        else:
            in_ax.plot(in_data, 'r.')
    elif len(in_data.shape) == 2:
        if show_hist:
            for i in range(in_data.shape[1]):
                in_ax.hist(in_data[:, i], label='Dim:{}'.format(i), alpha=0.5)
            in_ax.legend()
        else:
            if in_data.shape[1] == 2:
                in_ax.plot(in_data[:, 0], in_data[:, 1], 'r.')
            else:
                in_ax.plot(in_data, '.')
    elif len(in_data.shape) == 3:
        if show_hist:
            in_ax.hist(in_data.ravel())
        else:
            n_stack = np.stack([(x-x.mean())/x.std() for x in in_data], 0)
            in_ax.imshow(montage2d(n_stack))


def show_pipe(pipe, in_data, show_hist=False):
    m_rows = np.ceil((len(pipe.steps)+1)/3).astype(int)
    fig, t_axs = plt.subplots(m_rows, 3, figsize=(12, 5*m_rows))
    m_axs = t_axs.flatten()
    [c_ax.axis('off') for c_ax in m_axs]
    last_data = in_data
    for i, (c_ax, (step_name, step_op)) in enumerate(zip(m_axs, [('Input Data', None)]+pipe.steps), 1):
        if step_op is not None:
            try:
                last_data = step_op.transform(last_data)
            except AttributeError:
                try:
                    last_data = step_op.predict_proba(last_data)
                except AttributeError:
                    last_data = step_op.predict(last_data)

        display_data(c_ax, last_data, show_hist)
        c_ax.set_title('Step {} {}\n{}'.format(i, last_data.shape, step_name))
        c_ax.axis('on')


def flatten_func(x): return np.reshape(x, (np.shape(x)[0], -1))


flatten_step = FunctionTransformer(flatten_func, validate=False)


def px_flatten_func(in_x):
    if len(in_x.shape) == 2:
        x = np.expand_dims(in_x, -1)
    elif len(in_x.shape) == 3:
        x = in_x
    elif len(in_x.shape) == 4:
        x = in_x
    else:
        raise ValueError(
            'Cannot work with images with dimensions {}'.format(in_x.shape))
    return np.reshape(x, (-1, np.shape(x)[-1]))


px_flatten_step = FunctionTransformer(px_flatten_func, validate=False)


def add_filters(in_x, filt_func=[lambda x: gaussian(x, sigma=2),
                                 lambda x: gaussian(
                                     x, sigma=5)-gaussian(x, sigma=2),
                                 lambda x: gaussian(x, sigma=8)-gaussian(x, sigma=5)]):
    if len(in_x.shape) == 2:
        x = np.expand_dims(np.expand_dims(in_x, 0), -1)
    elif len(in_x.shape) == 3:
        x = np.expand_dims(in_x, -1)
    elif len(in_x.shape) == 4:
        x = in_x
    else:
        raise ValueError(
            'Cannot work with images with dimensions {}'.format(in_x.shape))
    n_img, x_dim, y_dim, c_dim = x.shape
    out_imgs = [x]
    for c_filt in filt_func:
        out_imgs += [np.stack([np.stack([c_filt(x[i, :, :, j])
                                         for i in range(n_img)], 0)
                               for j in range(c_dim)], -1)]

    return np.concatenate(out_imgs, -1)


filter_step = FunctionTransformer(add_filters, validate=False)


def add_xy_coord(in_x, polar=False):
    if len(in_x.shape) == 2:
        x = np.expand_dims(np.expand_dims(in_x, 0), -1)
    elif len(in_x.shape) == 3:
        x = np.expand_dims(in_x, -1)
    elif len(in_x.shape) == 4:
        x = in_x
    else:
        raise ValueError(
            'Cannot work with images with dimensions {}'.format(in_x.shape))
    n_img, x_dim, y_dim, c_dim = x.shape

    _, xx, yy, _ = np.meshgrid(np.arange(n_img),
                               np.arange(x_dim),
                               np.arange(y_dim),
                               [1],
                               indexing='ij')
    if polar:
        rr = np.sqrt(np.square(xx-xx.mean())+np.square(yy-yy.mean()))
        th = np.arctan2(yy-yy.mean(), xx-xx.mean())
        return np.concatenate([x, rr, th], -1)
    else:
        return np.concatenate([x, xx, yy], -1)


xy_step = FunctionTransformer(add_xy_coord, validate=False)
polar_step = FunctionTransformer(
    lambda x: add_xy_coord(x, polar=True), validate=False)


def fit_img_pipe(in_pipe, in_x, in_y):
    in_pipe.fit(in_x,
                px_flatten_func(in_y)[:, 0])

    def predict_func(new_x):
        x_dim, y_dim = new_x.shape[0:2]
        return in_pipe.predict(new_x).reshape((x_dim, y_dim, -1))
    return predict_func
