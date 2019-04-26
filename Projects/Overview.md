# Project Overview

- Scientifically driven project __clear question__
 - _Not_ count number of bubbles in system
 - Does temperature affect bubble size?
- Take images through appropriate processing steps
- Characterize parameter space and error sources
- Short presentation (5-10 minutes depending on number of students) 
 - Problem
 - Solution
 - Key Findings

# Sign Up Link
[Here](https://docs.google.com/spreadsheets/d/1Xvf4I5t-QkgXFBoDJ8BrMA8RTtuZWILfFBRhMjqP8Z8/edit#gid=618907183) you can sign up for the projects and [here](https://qbi2019.slack.com/messages/projects/) you can discuss with other students about forming teams or other ideas.

# Our Projects
## Detection and Analysis of Calcifications in Breast Mamographies (Z. Wang)

- Calcification count and type is an important criterion for breast cancer diagnosis but it is done manually due to the complexity of breast tissue

![Breast Calcifications](images/breast-abs.jpg?raw=true)

## Circardian Rhythm in Neuron Cells
Fluorescence signal in neuron cells in the region of the brain responsible for circadian regulation

![Brain](images/brainScan.gif?raw=true)

- Dataset and Kernels on https://www.kaggle.com/kmader/circadian-rhythm-in-the-brain

### Questions

 - Do the cells move during the experiment?
 - How regular is their signal? 
  - Is the period 24 hours?
 - Do nearby cells oscillate together?
 - Do they from chunks or groups, over what range do they work?
 - Are there networks formed from time-precedence?

# Projects of Personal Interest

## Running Analysis from Video

The idea would be to quantify body movement in videos of people running (head, legs, arms, hips) in order to start to classify different types of runners and ultimately provide feedback. Ideally the work could be transformed into an app on the phone and used by runners everywhere. The idea could also be applied to different sports and physical events. 

![Runner](images/running_pose.png?raw=true)

- Example Kernel: https://www.kaggle.com/kmader/running-pose-estimate
- Code: https://github.com/ildoonet/tf-pose-estimation
- References: https://github.com/ildoonet/tf-pose-estimation/blob/master/etcs/reference.md

### Questions
- Can you quantify the difference between fast and slower runners (maybe use race finisher videos or timelapses from a fixed point on the course: https://www.youtube.com/watch?v=jLcGr_EhUgA)
- Can you identify the difference between amateur and professional racers?
- Can you predict the winner of a race from the first few seconds?
- Can you use anomaly detection to determine runners doing incorrect moves?

# Kaggle Projects

## Right Whale Identification


- All information copied from [here](https://www.kaggle.com/c/noaa-right-whale-recognition)

```
Currently, only a handful of very experienced researchers can identify individual whales on sight while out on the water. For the majority of researchers, identifying individual whales takes time, making it difficult to effectively target whales for biological samples, acoustic recordings, and necessary health assessments.
```

Example whale image to identify:
![Whale](images/ChristinKhan_RightWhaleMomCalf_640.png?raw=true)


## Heart Ejection Fraction from MRI: Data Science Bowl 

- All information copied from [here](https://www.kaggle.com/c/second-annual-data-science-bowl)

The goal is to automatically measure the ejection fraction of a heart using 4D (3D + time) images of the heart. There are over 17GB of images to analyze and a few hints on the forums on how to use analytical (Fourier method) and Deep Learning approaches.


![MRI Segmentation](images/mri_kaggle.gif?raw=true)


## Connecteomics
- Can a cell network be reconstructed from the fluorescence signals of the firing neurons?
- [$3000 in Prize Money for Best Result](https://www.kaggle.com/c/connectomics)

[Show video](https://www.youtube.com/embed/lppAwkek6DI)

<iframe width="420" height="315" src="https://www.youtube.com/embed/lppAwkek6DI" frameborder="0" allowfullscreen></iframe>

## Digit Recognizer
- Can digits be accurately identified from images?
- [Automated identification](https://www.kaggle.com/c/digit-recognizer) is important for thousands of applications from traffic control to reciept validation.
- Number of solutions already [available](https://www.kaggle.com/c/digit-recognizer/prospector)
 
(Image borrowed from: Andrej Karpathy, http://karpathy.github.io/2015/05/21/rnn-effectiveness/)
![Digits](images/house_read.gif?raw=true)
