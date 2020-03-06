# pHanalysis
These codes process 3D segmentation measurements of signal intensity in z-stacks of multichannel images.
Written by Fengzhu Xiong (xiongfzwmq@gmail.com). These codes are related to the publication Oginuma et al., 2020, Nature. A sample raw data file (20150427pH.xls) is provided for demonstration purposes.
The main file is pHanalysis.m, use this file to perform all analysis and control parameters.
The script creates a scatter plot for segmentations, a binned average, and an exponential fit to the binned average, output a,b from the fit and calculate a difference between ratios between channels and different locations of the image data using anchor points that mark the axis in the raw data file.
Open License: The codes can be freely copied, edited and reused
