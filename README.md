[![Binder with JupyterLab](https://img.shields.io/badge/launch-jupyterlab-red.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?urlpath=lab)
[![Build Status](https://travis-ci.org/kmader/Quantitative-Big-Imaging-2019.svg?branch=master)](https://travis-ci.org/kmader/Quantitative-Big-Imaging-2019)
[![CircleCI](https://circleci.com/gh/kmader/Quantitative-Big-Imaging-2019.svg?style=svg)](https://circleci.com/gh/kmader/Quantitative-Big-Imaging-2019)

## Quantitative Big Imaging Course 2019

Here are the lectures, exercises, and additional course materials corresponding to the spring semester 2019 course at ETH Zurich, [227-0966-00L](http://www.vvz.ethz.ch/Vorlesungsverzeichnis/lerneinheit.view?lerneinheitId=128120&semkez=2019S&ansicht=KATALOGDATEN&lang=en): Quantitative Big Imaging.

The lectures have been prepared and given by Kevin Mader and associated guest lecturers. Please note the Lecture Slides and PDF do not contain source code, this is only available in the handout file. Some of the lectures will be recorded and placed on YouTube on the [QBI Playlist](https://www.youtube.com/playlist?list=PLTWuXgjdOrnmXVVQG5DRkVeOIGOcTmCIw). The lectures are meant to be followed in chronological order and each lecture has a corresponding hands-on exercises in the exercises section.

## Learning Objectives

### General
1. Ability to compare qualitative and quantitative methods and name situations where each would be appropriate
1. Awareness of the standard process of image processing, the steps involved and the normal order in which they take place
1. Ability to create and evaluate quantitative metrics to compare the success of different approaches/processes/workflows
1. Appreciation of automation and which steps it is most appropriate for
1. The relationship between automation and reproducibility for analysis

### Image Enhancement

1. Awareness of the function enhancement serves and the most commonly used methods
1. Knowledge of limitations and new problems created when using/overusing these techniques

### Segmentation
1. Awareness of different types of segmentation approaches and strengths of each
1. Understanding of when to use automatic methods and when they might fail

### Shape Analysis
1. Knowledge of which types of metrics are easily calculated for shapes in 2D and 3D
1. Ability to describe a physical measurement problem in terms of shape metrics
1. Awareness of common metrics and how they are computed for arbitrary shapes

### Statistics / Big Data
1. Awareness of common statistical techniques for hypothesis testing
1. Ability to design basic experiments to test a hypothesis
1. Ability to analyze and critique poorly designed imaging experiments
1. Familiarity with vocabulary, tools, and main concepts of big data
1. Awareness of the differences between normal and big data approaches
1. Ability to explain MapReduce and apply it to a simple problem


## Target Audience

The course is designed with both advanced undergraduate and graduate level students in mind. Ideally students will have some familiarity with basic manipulation and programming in languages like Python (Matlab or R are also reasonable starting points). Much of the material is available as visual workflows in a tool called KNIME, although these are less up to date than the Python material. Interested students who are worried about their skill level in this regard are encouraged to contact Kevin Mader directly (mader@biomed.ee.ethz.ch).

- Students with very diverse academic backgrounds have done well in the course (Informatics to Art History to Agriculture).
- Successful students typically spent a few hours a week working on the exercises to really understand the material.
- More advanced students who are already very familiar with Python, C++, or Java are also encouraged to take the course and will have to opportunity to develop more of their own tools or explore topics like machine learning in more detail.

# Slack

For communicating, discussions, asking questions, and everything, we will be trying out Slack this year. You can sign up under the following [link](https://join.slack.com/t/qbi2019/shared_invite/enQtNTU2NjQwNDU3NjUxLTc0YzA0YTVhNjQxZmNhMzQwZjM4NzlhNWExOWEyNzQzZGJjYWU3N2YyNmM4YTJkOGJlZTFlZGIyMmUwMmY0MmE). It isn't mandatory, but it seems to be an effective way to engage collaboratively [How scientists use slack](http://www.nature.com/news/how-scientists-use-slack-1.21228)

# Weekly Plan

### 21st February - Introduction and Workflows

- [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/01-Introduction.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/01-Introduction.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/01-Introduction.ipynb)
- [Lecture Video](https://www.youtube.com/watch?v=_3UCWECqIHY&list=PLTWuXgjdOrnmXVVQG5DRkVeOIGOcTmCIw&index=3&t=0s)
 
#### Exercises

- [Getting Started with KNIME](Exercises/01-Description.md)
- [Introduction to Python and Jupyter for Data-Science](https://github.com/jakevdp/PythonDataScienceHandbook)

### 28th February - Ground Truth: Building and Augmenting Datasets

- [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/02-Datasets.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/02-Datasets.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/02-Datasets.ipynb)
- [Lecture Video](https://www.youtube.com/watch?v=TNZWUU84DLg&list=PLTWuXgjdOrnmXVVQG5DRkVeOIGOcTmCIw&index=4)

#### Exercises

- [Data Augmentation in KNIME](Exercises/02-augmentation/LungNodules.knar)


### 7th March - Image Enhancement (Guest Lecture - A. Kaestner)

- [Lecture Slides](Lectures/03-ImageEnhancement.pdf)
- [Old Lecture Video](https://www.youtube.com/watch?v=NlHRzgdw0p0&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M&index=3)

#### Exercises

- [![imagetool](https://img.shields.io/badge/launch-image_enhancement_tool-yellow.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?urlpath=%2Fapps%2FExercises%2FImageEnhancementPlayground.ipynb)
- [Overview](Exercises/ImageEnhancement.md)

### 14th March - Basic Segmentation, Discrete Binary Structures

- [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/04-BasicSegmentation.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/04-BasicSegmentation.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/04-BasicSegmentation.ipynb)
 - Part 2: [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/04-BasicSegmentation_Part2.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/04-BasicSegmentation_Part2.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/04-BasicSegmentation_Part2.ipynb)
 
 - [Lecture Video](https://www.youtube.com/watch?v=LFwHVO5zDzY&index=5&list=PLTWuXgjdOrnmXVVQG5DRkVeOIGOcTmCIw)
 
#### Exercises

- [Overview](Exercises/04-Overview.md)

### 21th March - Advanced Segmentation

-  Part 1: [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/05-AdvancedSegmentation.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/05-AdvancedSegmentation.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/05-AdvancedSegmentation.ipynb)
 
- Part 2: [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/05-SupervisedSegmentation.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/05-SupervisedSegmentation.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/05-SupervisedSegmentation.ipynb) 
 
- [Lecture Video](https://www.youtube.com/watch?v=wIEstgKwEro&list=PLTWuXgjdOrnmXVVQG5DRkVeOIGOcTmCIw&index=8&t=0s)

#### Exercises

- [Overview](Exercises/05-Overview.md)

### 28th March - Analyzing Single Objects, Shape and Texture

 - Part 1: [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/06-ShapeAnalysis.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/06-ShapeAnalysis.ipynb) [Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/06-ShapeAnalysis.ipynb)

- Part 2: [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/06-AdvancedShapeAndTexture.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/06-AdvancedShapeAndTexture.ipynb) [Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/06-AdvancedShapeAndTexture.ipynb)

- [Lecture Video](https://www.youtube.com/watch?v=AwFK7DLkTCI&list=PLTWuXgjdOrnmXVVQG5DRkVeOIGOcTmCIw&index=11&t=3s)

#### Exercises

- [Overview](Exercises/06-Overview.md)

### 4th April - Analyzing Complex Objects

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/07-ComplexObjects.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/07-ComplexObjects.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/07-ComplexObjects.ipynb)
 - [Lecture Video](https://www.youtube.com/watch?v=tju1A_QvIPU&list=PLTWuXgjdOrnmXVVQG5DRkVeOIGOcTmCIw&index=12)
 - [Old Lecture Video](https://www.youtube.com/watch?v=apDElYtI7jo&t=0s&index=15&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M)

#### Exercises

- [Overview](Exercises/07-Overview.md)


### 11th April - Dynamic Experiments

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/08-DynamicExperiments.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/08-DynamicExperiments.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/08-DynamicExperiments.ipynb)
 
 - [Old Lecture Video (silent, technical problems)](https://www.youtube.com/watch?v=K43wDnhk7Ec&index=17&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M&t=41s), for voice-over use [Old Lecture Video](https://youtu.be/77kmZjiKQYQ)
 
#### Exercises

- [KNIME Exercises](https://rawgithub.com/Quantitative-Big-Imaging/Quantitative-Big-Imaging-2016/master/Exercises/09-Description.html)
- [Kaggle Neuron Tracking](https://www.kaggle.com/kmader/track-neuron-movement)
- [Kaggle X-Ray Scan Registration](https://www.kaggle.com/kmader/x-ray-patient-scan-registration)
- [3D Sem Reconstruction (Under construction](https://www.kaggle.com/kmader/3d-reconstruction-with-feature-extraction)


### 18th April - Statistics, Prediction, and Reproducibility

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/10-Statistics.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/10-Statistics.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/10-Statistics.ipynb)
 - [Lecture Video](https://www.youtube.com/watch?v=n9vjUl0Yqfc&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M&index=19)

#### Exercises

- [KNIME Exercises](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Exercises/08-Description.html)
- C. Elegans Dataset on Kaggle [R Notebook](https://www.kaggle.com/kmader/d/kmader/high-content-screening-celegans/qbi-statistics-and-reproducibility-in-r/) or [Python Notebook](https://www.kaggle.com/kmader/d/kmader/high-content-screening-celegans/image-overview)
- Lung Segmentation [https://www.kaggle.com/kmader/dsb-lung-segmentation-algorithm/notebook](Rule-based Image Processing) and [Simple Neural Network](https://www.kaggle.com/kmader/simple-nn-with-keras)


 
### 2nd May - Scaling Up / Big Data

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/11-ScalingUp.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/11-ScalingUp.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/11-ScalingUp.ipynb)
 - [Lecture Video](https://www.youtube.com/watch?v=sJbOSaPqsx8&t=0s&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M&index=22)
 - [Old Lecture Slides](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2017/master/Lectures/10-Slides.html) [Old Lecture Handout](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2015/master/Lectures/11-handout.html) as [PDF](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Lectures/10-handout.pdf)
 - Old Lecture Video: [Part 1](https://www.youtube.com/watch?v=DReSAalWzq0&index=19&list=PLTWuXgjdOrnnBtf554bMfKV6n2S6XgcLv) and [Part 2](https://www.youtube.com/watch?v=QNOCCrQZa_E&index=20&list=PLTWuXgjdOrnnBtf554bMfKV6n2S6XgcLv)

#### Exercises

- [KNIME / Spark Exercises](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2017/master/Exercises/10-Description.md)
- [Tensorflow DAG Notebook Filtering](https://github.com/kmader/Quantitative-Big-Imaging-2017/blob/master/Exercises/Ex10-UsingTensorflow.ipynb)
- [Kaggle DAG Notebook for Filtering](https://www.kaggle.com/kmader/simple-dags-in-tensorflow)
- [Block-based 3D Image Analysis in Dask](https://www.kaggle.com/kmader/3d-image-analysis-using-dask)


### 9th May - Guest Lecture - High Content Screening (M. Prummer)

- [High Content Screening Slides](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Lectures/11-HCSSlides.pdf) - Michael Prummer / Nexus / Roche
  
#### Exercises

- [High Content Screening with C. Elegans](https://www.kaggle.com/kmader/high-content-screening-celegans)
- Goal is looking at what metrics accurately indicate living or dead worms and building a simple predictive model
- [Kaggle Overview](https://www.kaggle.com/kmader/d/kmader/high-content-screening-celegans/image-overview)
- [Shape Analysis](https://www.kaggle.com/kmader/worm-shape-analysis)
- [Processing in R](https://www.kaggle.com/kmader/basic-analysis-in-r)


### 16th May - TBD
### 23rd May - Project Presentations


# Exercises
## General Information
The exercises are based on the lectures and take place in the same room after the lecture completes. The exercises are designed to offer a tiered level of understanding based on the background of the student. We will (for most lectures) take advantage of an open-source tool called KNIME (www.knime.org), with example workflows here (https://www.knime.org/example-workflows).  The basic exercises will require adding blocks in a workflow and adjusting parameters, while more advanced students will be able to write their own snippets, blocks or plugins to accomplish more complex tasks easily.
The exercises from two years ago (available [here](http://kmader.github.io/Quantitative-Big-Imaging-2015/) are done entirely in ImageJ and Matlab for students who would prefer to stay in those environments (not recommended)

### Install KNIME

* Windows: https://www.dropbox.com/s/75hx7fdpnpzrh5u/knime_rsna_2018.zip?dl=0
* Mac: https://www.dropbox.com/s/3tdssp67daadzix/knime_rsna_mac.zip?dl=0
* (After you extract it move the KNIME.app into the /Applications/ folder)

### Install Python

If you use colab, kaggle or mybinder you won't need python on your own machine but if you want to set it up in the same way the class has you can follow the instructions shown in the video [here](https://youtu.be/bnTCLLSpyf0) and below
1. Install Anaconda Python https://www.anaconda.com/distribution/#download-section
1. Download the course from github as a zip file
1. Extract the zip file
1. Open a terminal (or command prompt on windows)
1. Go to the binder folder inside the course directory (something like: `Downloads/Quantitative-Big-Imaging-2019-master/binder`)
1. Install the environment
1. `conda env create -f environment.yml`
1. Activate the environment `conda activate qbi2019` or `activate qbi2019`
1. Go up one directory to the root of the course `cd ..`
1. Start python `jupyter notebook`


## Assistance
The exercises will be supported by Amogha Pandeshwar and Kevin Mader. There will be office hours in ETZ H75 on Thursdays between 14-15 or by appointment.

## Online Tools
The exercises will be available on Kaggle as 'Datasets' and we will be using mybinder as stated above.


# Feedback (as much as possible)
 - Create an [issue](https://github.com/kmader/Quantitative-Big-Imaging-2019/issues) (on the group site that everyone can see and respond to, requires a Github account), [issues from last year](https://github.com/kmader/Quantitative-Big-Imaging-2015/issues)
 - Provide anonymous feedback on the course [here](https://docs.google.com/spreadsheet/embeddedform?formkey=dEtIX1ZXMzFacmdhRF9mQVpNaWtWTXc6MA)
 - Or send direct email (slightly less anonymous feedback) to [Kevin](mailto:mader@biomed.ee.ethz.ch)

# Final Examination

The final examination (as originally stated in the course material) will be a 30 minute oral exam covering the material of the course and its applications to real systems. For students who present a project, they will have the option to use their project for some of the real systems related questions (provided they have sent their slides to [Kevin](mailto:mader@biomed.ee.ethz.ch) after the presentation and bring a printed out copy to the exam including several image slices if not already in the slides).  The exam will cover all the lecture material from Image Enhancement to Scaling Up (the guest lecture will not be covered). Several example questions (not exhaustive) have been collected which might be helpful for preparation.
- [Practice Questions](https://rawgithub.com/kmader/Quantitative-Big-Imaging-Course/master/PracticeExam/exam.html)


# Projects
- [Overview](Projects/Overview.md) of possible projects
- [Here](https://docs.google.com/spreadsheets/d/1Xvf4I5t-QkgXFBoDJ8BrMA8RTtuZWILfFBRhMjqP8Z8/edit#gid=618907183) you signup for your project with team members and a short title and description


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

# Other Material

- [Data Science/Python Introduction Handbook](https://github.com/jakevdp/PythonDataScienceHandbook)
- [ETH Deep Learning Course](http://www.da.inf.ethz.ch/teaching/2018/DeepLearning/) taught in the Fall Semester, also uses Python but with a much more intensive mathematical grounding and less focus on images.
- [EPFL Deep Learning Course](https://fleuret.org/ee559/) taught in the Spring Semester by Francois Fleuret, uses Python and PyTorch covers theoretical topics and more advanced research topics with a number of applications and code.
- [FastAI Deep Learning Course](http://course.fast.ai/) and [Part 2](http://course.fast.ai/part2.html) for a very practically focused introduction to Deep Learning using the Python skills developed in QBI.
- [Deep Learning for Self-Driving Cars at MIT](https://selfdrivingcars.mit.edu/) open to beginners and is designed for those who are new to machine learning, but it can also benefit advanced researchers in the field looking for a practical overview of deep learning methods and their application
- Reproducible Research
 - [Coursera Course](https://www.coursera.org/course/repdata)
 - [Course and Tools in R](http://kbroman.github.io/Tools4RR/)
- Performance Computing Courses
 - [High Performance Computing for Science and Engineering (HPCSE) I](http://www.cse-lab.ethz.ch/teaching/hpcse-i_hs17/)
 - [Programming Massively Parallel Processors with CUDA](https://itunes.apple.com/us/itunes-u/programming-massively-parallel/id384233322?mt=10)
- [Introduction to Machine Learning (EPFL)](https://github.com/wildtreetech/advanced-computing-2018)

### Additional Lectures from Previous Years

#### Tutorial: Python, Notebooks and Scikit

 - Lecture [slides](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2017/master/Lectures/03-QBI-PythonTutorial.slides.html)
 - [Handout](https://github.com/kmader/Quantitative-Big-Imaging-2017/blob/master/Exercises/03-QBI-PythonTutorial.ipynb)

#### Roads from Aerial Images
Javier Montoya / Computer Vision / ScopeM

 - [Slides](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Lectures/11-AerialSlides.pdf)
 - [KNIME Exercises](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Exercises/11-Description.html)
 - [KNIME Workflow](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Exercises/11-files/AerialImages.zip)
 - [IPython Notebook](https://github.com/kmader/Quantitative-Big-Imaging-2016/blob/master/Exercises/11-notebook.ipynb)
 - [Python Data](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Exercises/12-files/lab_images.npz)
 - [IPython Notebook](https://github.com/kmader/Quantitative-Big-Imaging-2016/blob/master/Exercises/12-notebook.ipynb)

#### Introduction to Deep Learning / Machine Learning

Presented by Aurelien Lucchi in [Data Analytics Lab](http://www.da.inf.ethz.ch) in D-INFK at ETHZ

 - [Slides](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Lectures/12-DeepLearning.pdf)

