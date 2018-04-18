UCSD CSE 190 Computer Vision Final Project: Outdoor Performance Analysis of monocular ORB_SLAM2 on Varied Lighting and Weather Conditions
=======================================================

Author: Yichen Li, Yunbo Chen


Abstract:
=======================================================

We are here to present an investigation of the influences of lighting and weather conditions on the outdoor performance of monocular ORB_SLAM2 algorithm. Specifically, we performed monocular ORB_SLAM2 on Oxford Robotcar Dataset, with different conditions (overcast, rain and night) to estimate the trajectories. We calculated the trajectory errors and also did an inspection on the continuity of estimated trajectories. 

After the analysis, the major findings are: the precision of estimated trajectory depends largely on the lighting conditions. In particular, the precision of the estimated trajectory is the best in overcast weather and the worst at night. The tracking performance is significantly influenced by the image exposure. Overexposure and underexposure in the large scale would deteriorate the tracking ability and cause ORB_SLAM2 to relocalize and reinitiate, which results in a scale drift.


Dataset:
=======================================================

We used Oxford Robotcar Dataset for this project. 
The images we used:
1. Dataset 2015/08/13 16:02:58 GMT, Bumblebee XB3 stereo left images, overcast. 
2. Dataset 2015/02/03 19:43:11 GMT, Bumblebee XB3 stereo left images, night.
3. Dataset 2015/10/29 12:18:17 GMT, Bumblebee XB3 stereo left images, rain.


Usage:
=======================================================

1. Make sure you are running an Ubuntu 12.04, 14.04 and 16.04 environment. (Virtual machine not guaranteed)
2. Install all dependencies and compile ORB_SLAM2 according to the instructions in ORB_SLAM2 github: https://github.com/raulmur/ORB_SLAM2
3. In the directory /ORB_SLAM2/robotcar-dataset-sdk/python, change the path in test.py to your own images and output directory to test_data/rgb. run the test.py for preprocessing
4. Run "python txt.py rgb" in test_data/ to generate the txt file for the imageset
5. Run "./Examples/Monocular/mono_tum Vocabulary/ORBvoc.txt Examples/Monocular/mysetting.yaml /home/xxx/test_data" in the ORB_SLAM2 directory
6. After getting the result, run matlab code "conversion.m" to convert the ground truth and estimated trajectory
7. Use the test.py in evaluate_ate_scale to calculate the error

Report:
=======================================================

Please see CSE190 Project Report file for more details of implementation and evaluation.


Reference:
=======================================================

https://github.com/raulmur/ORB_SLAM2

https://github.com/liyichen7887/robotcar-dataset-sdk