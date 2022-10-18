# dicomread-and-dicomwrite
## Summary

This is the self-study note of using MATLAB to process DICOM. There are two kinds of data: the single slice of CT(.dcm) at the level of the third lumbar vertebra and segmented images which are segmented the muscle region. We are interested in muscle regions and called region of interest (ROI). The DICOM dataset is not provided due to confidentiality. 

__Data:__  
| Original CT image(.dcm) | Segmented image(.tiff) |  
|--|--|
|![](https://i.imgur.com/85Kfcm4.png)|<img src="https://i.imgur.com/2acw0Rp.png" width="335">|  

All images of size are 512*512 pixels (The tiff files have been preprocessed.)  

Now, I have two purposes:
1. Convert CT imaged values to Hounsfield unit(HU) and overlap the ROI, so that we can observe whether the segmentation is the muscle region. Skeletal muscle is defined as −29 to +150 HU, so I choose two ranges: −29 to +150 HU and 0 to 100 HU.  
2. Let ROI have DICOM metadata

Thanks for Professor Lu's teaching, the following resources are Professor Lu's tutorial.  
Tutorial: http://cflu.lab.nycu.edu.tw/CFLu_course_matlabml.html


## Environment and basic products
MATLAB Version: R2020b

Basic installation: 
- MATLAB
- Bioinformatics Toolbox
- Curve Fitting Toolbox
- Image Acquisition Toolbox
- Image Processing Toolbox
- Optimization Toolbox
- Signal Processing Toolbox
- Statistics and Machine Learning Toolbox

During the installation, check the basic installation.
![GITHUB](https://i.imgur.com/O8eXQRq.png)


## Results:

1. The image(HU: -29 ~ 150) and ROI overlap  

| Original CT image | Segmented image | Result |  
|--|--|--|  
|![](https://i.imgur.com/85Kfcm4.png)|<img src="https://i.imgur.com/2acw0Rp.png" width="335">|<img src="https://i.imgur.com/6nYtnZI.png" width="337">|  

2. The image(HU: 0 ~ 100) and ROI overlap 

| Original CT image | Segmented image | Result |  
|--|--|--|  
|![](https://i.imgur.com/85Kfcm4.png)|<img src="https://i.imgur.com/2acw0Rp.png" width="335">|<img src="https://i.imgur.com/LH54BsV.png" width="337">|  

3. ROI have DICOM metadata

| Original CT image | Segmented image | Result |  
|--|--|--|  
|![](https://i.imgur.com/85Kfcm4.png)|<img src="https://i.imgur.com/2acw0Rp.png" width="335">|![](https://i.imgur.com/mH4trUj.png)|


