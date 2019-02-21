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

# Lectures

### 21st February - Introduction and Workflows

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/01-Introduction.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/01-Introduction.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/01-Introduction.ipynb)
 - [Lecture Video](https://www.youtube.com/watch?v=_3UCWECqIHY&list=PLTWuXgjdOrnmXVVQG5DRkVeOIGOcTmCIw&index=3&t=0s)

### 28th February - Ground Truth: Building and Augmenting Datasets

- [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/02-Datasets.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2019/master?filepath=Lectures/02-Datasets.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2019/blob/master/Lectures/02-Datasets.ipynb)

### 7th March - Image Enhancement (Guest Lecture - A. Kaestner)

 - [Lecture Slides](Lectures/02-ImageEnhancement.pdf)
 - [Lecture Video](https://www.youtube.com/watch?v=NlHRzgdw0p0&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M&index=3)
 - [![imagetool](https://img.shields.io/badge/launch-image_enhancement_tool-yellow.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?urlpath=%2Fapps%2FExercises%2FImageEnhancementPlayground.ipynb)

### 14th March - Basic Segmentation, Discrete Binary Structures

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/03-BasicSegmentation.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/03-BasicSegmentation.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/03-BasicSegmentation.ipynb)
 - Part 2: [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/03-BasicSegmentation_Part2.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/03-BasicSegmentation_Part2.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/03-BasicSegmentation_Part2.ipynb)
 - [Lecture Video](https://www.youtube.com/watch?v=EX9856r1pq0&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M&index=5&t=0s)
 - [Old Lecture Slides](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2017/master/Lectures/03-Slides.html) [Old Lecture Handout](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Lectures/03-Handout.html) as [PDF](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2015/master/Lectures/03-Handout.pdf)

### 21th March - Advanced Segmentation

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/04-AdvancedSegmentation.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/04-AdvancedSegmentation.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/04-AdvancedSegmentation.ipynb)
 - [Lecture Video](https://www.youtube.com/watch?v=3ZU-4CQ1Ias&index=7&t=0s&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M)
 - [Old Lecture Slides](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2017/master/Lectures/04-Slides.html)
 - [Old Lecture Handout](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Lectures/04-Slides_files/04-Handout.html) as [Old PDF](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2015/master/Lectures/04-Handout.pdf)

###  28th March - Supervised Problems and Segmentation

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/05-SupervisedApproaches.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/05-SupervisedApproaches.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/05-SupervisedApproaches.ipynb)
 - [Lecture Video](https://www.youtube.com/watch?v=nGgFXlal_OA&index=9&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M)

### 4th April - Analyzing Single Objects, Shape and Texture

 - [Object Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/06-ShapeAnalysis.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/06-ShapeAnalysis.ipynb) [Object Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/06-ShapeAnalysis.ipynb)

- [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/07-AdvancedShapeAndTexture.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/07-AdvancedShapeAndTexture.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/07-AdvancedShapeAndTexture.ipynb)

- [Lecture Video Part 1](https://www.youtube.com/watch?v=E03dXgqI7rs&index=11&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M)
- [Lecture Video Part 2](https://www.youtube.com/watch?v=_kEEu0RhCt0&t=0s&index=12&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M)


### 11th April - Analyzing Complex Objects and Distributions

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/08-ComplexObjects.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/08-ComplexObjects.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/08-ComplexObjects.ipynb)
 - [Lecture Video](https://www.youtube.com/watch?v=apDElYtI7jo&t=0s&index=15&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M)
 - Old Lecture Video: [Part 1](https://youtu.be/GXg61CZx6Yc), [Part 2](https://youtu.be/8F4ClTTXI2w), [Part 3](https://youtu.be/hkHdpQTlGio), [Part 4](https://youtu.be/UvOPxdKZ3NI)
 - [Old Lecture Slides](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2017/master/Lectures/07-Slides.html) [Old Lecture Handout](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Lectures/07-Slides_files/07-handout.html)

### 18th April - Dynamic Experiments

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/09-DynamicExperiments.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/09-DynamicExperiments.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/09-DynamicExperiments.ipynb)
 - [Lecture Video (silent, technical problems)](https://www.youtube.com/watch?v=K43wDnhk7Ec&index=17&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M&t=41s), for voice-over use [Old Lecture Video](https://youtu.be/77kmZjiKQYQ)

 - [Old Lecture Slides](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2017/master/Lectures/09-Slides.html), [Old Lecture Handout](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2015/master/Lectures/10-handout.html),

### 2nd May - Statistics, Prediction, and Reproducibility

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/10-Statistics.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/10-Statistics.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/10-Statistics.ipynb)
 - [Lecture Video](https://www.youtube.com/watch?v=n9vjUl0Yqfc&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M&index=19)

 - [Old Lecture Slides](https://rawgit.com/Quantitative-Big-Imaging/Quantitative-Big-Imaging-2017/master/Lectures/08-Slides.html)
 - [Old Lecture Handout](https://rawgit.com/Quantitative-Big-Imaging/Quantitative-Big-Imaging-2017/master/Lectures/08-handout.html)
 - Old Lecture Video: [Part 1](https://youtu.be/UUa9zJtbuW4), [Part 2](https://youtu.be/nYz3_GERV6Q), [Part 3](https://youtu.be/yqWToMDc7u4)

### 9th May  - Guest Lecture - High Content Screening (M. Prummer)

  - [High Content Screening Slides](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Lectures/11-HCSSlides.pdf) - Michael Prummer / Nexus / Roche

### 16th May - Scaling Up / Big Data

 - [Slides (static)](http://nbviewer.jupyter.org/format/slides/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/11-ScalingUp.ipynb) [![slides](https://img.shields.io/badge/interactive-slides-green.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Lectures/11-ScalingUp.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Lectures/11-ScalingUp.ipynb)
 - [Lecture Video](https://www.youtube.com/watch?v=sJbOSaPqsx8&t=0s&list=PLTWuXgjdOrnnHVDj_xgpUfbnlPmvW_33M&index=22)
 - [Old Lecture Slides](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2017/master/Lectures/10-Slides.html) [Old Lecture Handout](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2015/master/Lectures/11-handout.html) as [PDF](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Lectures/10-handout.pdf)
 - Old Lecture Video: [Part 1](https://www.youtube.com/watch?v=DReSAalWzq0&index=19&list=PLTWuXgjdOrnnBtf554bMfKV6n2S6XgcLv) and [Part 2](https://www.youtube.com/watch?v=QNOCCrQZa_E&index=20&list=PLTWuXgjdOrnnBtf554bMfKV6n2S6XgcLv)

### 23rd May - Project Presentations

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


# Exercises
## General Information
The exercises are based on the lectures and take place in the same room after the lecture completes. The exercises are designed to offer a tiered level of understanding based on the background of the student. We will (for most lectures) take advantage of an open-source tool called KNIME (www.knime.org), with example workflows here (https://www.knime.org/example-workflows).  The basic exercises will require adding blocks in a workflow and adjusting parameters, while more advanced students will be able to write their own snippets, blocks or plugins to accomplish more complex tasks easily.
The exercises from two years ago (available [here](http://kmader.github.io/Quantitative-Big-Imaging-2015/) are done entirely in ImageJ and Matlab for students who would prefer to stay in those environments (not recommended)

### Install KNIME

* Windows: https://www.dropbox.com/s/75hx7fdpnpzrh5u/knime_rsna_2018.zip?dl=0
* Mac: https://www.dropbox.com/s/3tdssp67daadzix/knime_rsna_mac.zip?dl=0
* (After you extract it move the KNIME.app into the /Applications/ folder)

## Assistance
The exercises will be supported by Amogha Pandeshwar and Kevin Mader. There will be office hours in ETZ H75 on Thursdays between 14-15 or by appointment.

## Online Tools
The exercises will be available on Kaggle as 'Datasets' and we will be using mybinder as stated above.

## Specific Assignments

### 21st February - Introduction and Workflows
 - [Getting Started with KNIME](Exercises/01-Description.md)
 - [Introduction to Python and Jupyter for Data-Science](https://github.com/jakevdp/PythonDataScienceHandbook)

### 28th February - Datasets
 - TBD

### 7th March - Image Enhancement (A. Kaestner)
 - [Overview](Exercises/ImageEnhancement.md)

### 14th March/21st March - Basic Segmentation, Discrete Binary Structures

 - [KNIME Exercises](Exercises/03-Description.md)
 - [Old Workflows](https://github.com/kmader/Quantitative-Big-Imaging-2016/blob/master/Exercises/03-files/Workflows.zip?raw=true)
 - [Python Fossil Segmentation Exercises](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Kaggle_Competitions/03-Fossil.ipynb) or [binder](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Kaggle_Competitions/03-Fossil.ipynb)
 - [Python Nerve Segmentation Exercises](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Kaggle_Competitions/03-Exercises.ipynb) or [binder](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Kaggle_Competitions/03-Exercises.ipynb) or [Kaggle](https://www.kaggle.com/kmader/d/kmader/qbi-image-segmentation/fossil-data-viewing-and-analysis)

#### Kaggle

 - [Kaggle Dataset Overview](https://www.kaggle.com/kmader/qbi-image-segmentation)
 - [Bone Segmentation](https://www.kaggle.com/kmader/d/kmader/qbi-image-segmentation/segmenting-cells-in-bone-data/)
 - [Another Fossil Segmentation](https://www.kaggle.com/kmader/d/kmader/qbi-image-segmentation/teeth-fossil-viewing)

#### Hard Exercises

 - [Cell Segmentation on Kaggle](https://www.kaggle.com/gaborvecsei/basic-pure-computer-vision-segmentation-lb-0-229) or [binder](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Kaggle_Competitions/CV_CellSegmentation.ipynb)

### 28th March - Advanced Segmentation / Supervised Segmentation

 - [KNIME Exercises](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Exercises/04-Description.md)
 - [Python Exercises](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Exercises/04-Exercises.ipynb)
 - [Python Deep Learning](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Exercises/04-CNN.ipynb)

#### Kaggle

 - [Kernel for Ultrasound Segmentation - Exercises](https://www.kaggle.com/kmader/ultrasound-nerve-segmentation/qbi-advanced-image-segmentation/)
 - [Kernel for Superpixels on PETCT](https://www.kaggle.com/kmader/d/4quant/soft-tissue-sarcoma/superpixels-on-petct-for-labeling)
 - [Kernel for K-Means on Temporal/Video Data](https://www.kaggle.com/kmader/d/kmader/circadian-rhythm-in-the-brain/k-means-clustering-on-neurons)
 - [Advanced Kernel Predicting Malignancy using Superpixels](https://www.kaggle.com/kmader/d/4quant/soft-tissue-sarcoma/predicting-malignancy-in-superpixels)
 - [Multispectral / Hyperspectral Data](https://www.kaggle.com/kmader/d/xiaozhouwang/multispectralimages/data-overview)


###  4th April - Analyzing Shapes/Texture Analysis

#### Basic
 - [KNIME Exercises](https://github.com/kmader/Quantitative-Big-Imaging-2017/blob/master/Exercises/05-Description.md)
 - [Kaggle EM Cell Segmentation Intro](https://www.kaggle.com/kmader/d/kmader/electron-microscopy-3d-segmentation/qbi-single-object-analysis/) and [![slides](https://img.shields.io/badge/interactive-notebook-blue.svg)](http://mybinder.org/v2/gh/kmader/quantitative-big-imaging-2018/master?filepath=Exercises/06-Exercises.ipynb) [Lecture Handout](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Exercises/06-Exercises.ipynb)
 - [Kaggle MNIST Shape Analysis](https://www.kaggle.com/kmader/digit-recognizer/qbi2017-single-object-analysis)

### 4th April - Advanced Shape and Texture Analysis

- [KNIME Exercises](https://github.com/kmader/Quantitative-Big-Imaging-2016/blob/master/Exercises/06-Description.md)
- [Kaggle Texture Analysis scikit-image](https://www.kaggle.com/kmader/qbi-texture-analysis)
- [Kaggle Radiomics Analysis](https://www.kaggle.com/kmader/qbi-radiomics-analysis)
- [Paraview Curvature](https://github.com/kmader/Quantitative-Big-Imaging-2016/blob/master/Exercises/06-files/CurvatureContour.pvsm)
- [Python Exercises](http://nbviewer.jupyter.org/github/kmader/Quantitative-Big-Imaging-2018/blob/master/Exercises/07-AdvShape.ipynb)

### 11th April - Many Objects and Distributions
- [Battery Dataset](https://www.kaggle.com/kmader/battery-3d-images) The battery dataset along with Kernels for basic preprocessing and analysis.
- [KNIME Exercises](https://github.com/kmader/Quantitative-Big-Imaging-2017/blob/master/Exercises/07-Description.md)
- [IPython Notebook (Under development)](https://github.com/kmader/Quantitative-Big-Imaging-2017/blob/master/Exercises/07-notebook.ipynb)
- [Kaggle Street Network](https://www.kaggle.com/kmader/d/kmader/street-network-segmentation/thresholding-streets)
- [Kaggle Electron Microscopy Segmentation](https://www.kaggle.com/kmader/d/kmader/electron-microscopy-3d-segmentation/qbi-comple-object-analysis-skeletonization)
- [Kaggle Python Notebook](https://www.kaggle.com/kmader/d/kmader/qbi-image-enhancement/qbi2017-many-objects-and-distributions/)
- [Kaggle R Notebook](https://www.kaggle.com/kmader/d/kmader/qbi-image-enhancement/qbi2017-groups-of-objects-and-distributions/notebook)

### 18th April - Dynamic Experiments
 - [KNIME Exercises](https://rawgithub.com/Quantitative-Big-Imaging/Quantitative-Big-Imaging-2016/master/Exercises/09-Description.html)
 - [Kaggle Neuron Tracking](https://www.kaggle.com/kmader/track-neuron-movement)
 - [Kaggle X-Ray Scan Registration](https://www.kaggle.com/kmader/x-ray-patient-scan-registration)

### 2nd May - Statistics, Prediction, and Reproducibility

 - [KNIME Exercises](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2016/master/Exercises/08-Description.html)
 - C. Elegans Dataset on Kaggle [R Notebook](https://www.kaggle.com/kmader/d/kmader/high-content-screening-celegans/qbi-statistics-and-reproducibility-in-r/) or [Python Notebook](https://www.kaggle.com/kmader/d/kmader/high-content-screening-celegans/image-overview)
- Lung Segmentation [https://www.kaggle.com/kmader/dsb-lung-segmentation-algorithm/notebook](Rule-based Image Processing) and [Simple Neural Network](https://www.kaggle.com/kmader/simple-nn-with-keras)

### 9th May - Guest Lecture - High Content Screening (M. Prummer) / Project Presentations

- [High Content Screening with C. Elegans](https://www.kaggle.com/kmader/high-content-screening-celegans)
- Goal is looking at what metrics accurately indicate living or dead worms and building a simple predictive model
- [Kaggle Overview](https://www.kaggle.com/kmader/d/kmader/high-content-screening-celegans/image-overview)
- [Shape Analysis](https://www.kaggle.com/kmader/worm-shape-analysis)
- [Processing in R](https://www.kaggle.com/kmader/basic-analysis-in-r)

### 16th May - Scaling Up / Big Data

 - [KNIME / Spark Exercises](https://rawgithub.com/kmader/Quantitative-Big-Imaging-2017/master/Exercises/10-Description.md)
 - [Tensorflow DAG Notebook Filtering](https://github.com/kmader/Quantitative-Big-Imaging-2017/blob/master/Exercises/Ex10-UsingTensorflow.ipynb)
 - [Kaggle DAG Notebook for Filtering](https://www.kaggle.com/kmader/simple-dags-in-tensorflow)
 - [Block-based 3D Image Analysis in Dask](https://www.kaggle.com/kmader/3d-image-analysis-using-dask)

### 23st May - Project Presentations


# Feedback (as much as possible)
 - Create an [issue](https://github.com/kmader/Quantitative-Big-Imaging-2019/issues) (on the group site that everyone can see and respond to, requires a Github account), [issues from last year](https://github.com/kmader/Quantitative-Big-Imaging-2015/issues)
 - Provide anonymous feedback on the course [here](https://docs.google.com/spreadsheet/embeddedform?formkey=dEtIX1ZXMzFacmdhRF9mQVpNaWtWTXc6MA)
 - Or send direct email (slightly less anonymous feedback) to [Kevin](mailto:mader@biomed.ee.ethz.ch)

# Final Examination

The final examination (as originally stated in the course material) will be a 30 minute oral exam covering the material of the course and its applications to real systems. For students who present a project, they will have the option to use their project for some of the real systems related questions (provided they have sent their slides to [Kevin](mailto:mader@biomed.ee.ethz.ch) after the presentation and bring a printed out copy to the exam including several image slices if not already in the slides).  The exam will cover all the lecture material from Image Enhancement to Scaling Up (the guest lecture will not be covered). Several example questions (not exhaustive) have been collected which might be helpful for preparation.
- [Practice Questions](https://rawgithub.com/kmader/Quantitative-Big-Imaging-Course/master/PracticeExam/exam.html)


# Projects
- [Overview](Projects/Overview.md) of possible projects
- [Here](https://docs.google.com/spreadsheets/d/1Xvf4I5t-QkgXFBoDJ8BrMA8RTtuZWILfFBRhMjqP8Z8/edit#gid=1920771685) you signup for your project with team members and a short title and description


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
- Course Wiki (For Questions and Answers, discussions etc, we use the old one)
 - [Main Page](https://github.com/kmader/Quantitative-Big-Imaging-2016/wiki/)
- [Data Science/Python Introduction Handbook](https://github.com/jakevdp/PythonDataScienceHandbook)
- [ETH Deep Learning Course](http://www.da.inf.ethz.ch/teaching/2017/DeepLearning/) taught in the Fall Semester, also uses Python but with a much more intensive mathematical grounding and less focus on images.
- [FastAI Deep Learning Course](http://course.fast.ai/) and [Part 2](http://course.fast.ai/part2.html) for a very practically focused introduction to Deep Learning using the Python skills developed in QBI.
- Reproducible Research
 - [Coursera Course](https://www.coursera.org/course/repdata)
 - [Course and Tools in R](http://kbroman.github.io/Tools4RR/)
- Performance Computing Courses
 - [High Performance Computing for Science and Engineering (HPCSE) I](http://www.cse-lab.ethz.ch/teaching/hpcse-i_hs17/)
 - [Programming Massively Parallel Processors with CUDA](https://itunes.apple.com/us/itunes-u/programming-massively-parallel/id384233322?mt=10)
- [Introduction to Machine Learning (EPFL)](https://github.com/wildtreetech/advanced-computing-2018)
