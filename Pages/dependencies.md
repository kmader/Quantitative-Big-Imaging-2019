# Software Dependencies

The course, slides and exercises are primarily done using Python 3.6 and Jupyter Notebook 5.5. The binder/repo2docker-compatible environment](https://github.com/jupyter/repo2docker) can be found at [binder/environment.yml](https://github.com/kmader/Quantitative-Big-Imaging-2018/blob/master/binder/environment.yml). A full copy of the environment at the time the class was given is available in the [wiki](https://github.com/kmader/Quantitative-Big-Imaging-2018/wiki/Full-Package-List) file. As many of these packages are frequently updated we have also made a copy of the docker image produced by repo2docker uploaded to Docker Hub at https://hub.docker.com/r/kmader/qbi2018/

## All Lectures
The packages which are required for all lectures
- numpy
- matplotlib
- scipy
- scikit-image
- scikit-learn
- ipyvolume

## Machine Learning Packages
For machine learning and big data lectures a few additional packages are required
- tensorflow
- pytorch
- opencv
- dask
- dask_ndmeasure
- dask_ndmorph
- dask_ndfilter

## Image Registration / Medical Image Data
For the image registration lecture and medical image data
- itk
- SimpleITK
- itkwidgets