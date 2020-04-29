import numpy as numpy
import skimage.filters as filters

def camera(img,blurr=1.0,noise=0.1,illum=0.0) :

    res = filters.gaussian(img,sigma=blurr)
    res = res + np.random.normal(size=res.shape,m=0,s=noise)

    return res;