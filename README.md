# Assignment

## Preliminaries:

The configurations of running the dataset are contained in initSetting.m, and the major differences between running the Opensky and Urban datasets in initSetting.m are on the file path and the values of IF frequency and sampling frequency. For Opensky dataset, the settings on the file path and the values of IF frequency and sampling frequency are:

```
...
settings.fileName           = 'C:\Users\owner\Documents\MATLAB\GPS\Opensky.bin';
...
settings.IF                 = 1580e6-1575.42e6;     % [Hz]
settings.samplingFreq       = 58e6;       % [Hz]
...
```

Meanwhile, for Urban dataset, the settings on the file path and the values of IF frequency and sampling frequency are:

```
...
settings.fileName           = 'C:\Users\owner\Documents\MATLAB\GPS\Urban.dat';
...
settings.IF                 = 1580e6-1575.42e6;     % [Hz]
settings.samplingFreq       = 58e6;       % [Hz]
...
```
However, due to the large file size, the files Opensky.bin and Urban.dat will not be uploaded to this repository.

## Task 1: Process the IF data using a GNSS SDR and generate the initial acquisition results.

Signal acquisition is to identify all satellites visible to the user’s antenna and determine the course values of carrier Doppler frequency and code phase of the satellite signals.

To process the datasets, the file init.m is first run. Then, the plot "Acquisition results" and the sky plot are generated while the course values of carrier frequency and code phase of the satellite signals can be determined in the data stored under the variable "channel" in the Workspace. The Doppler frequency can be determined by the data in the field "acquiredFreq" minus the value of 4.58e6 (for Opensky dataset) or 0 (for Urban dataset). To generate the plot "3D Acquisition Results", the file Plots.m is run afterwards.

### Task 1 Results for Opensky Dataset

The satellites visible to the user’s antenna is summarized in the plot "Acquisition results".

![Acquisition](https://github.com/user-attachments/assets/1d2d12d5-6940-49f0-aa6a-1369ffe4defd)

The sky plot is shown in the below figure:

![SkyPlot](https://github.com/user-attachments/assets/9964b05a-475a-4763-9d13-3db0469aeac9)

The acquisition results is shown in the plot "3D Acquisition Results".

![Acquisition plot](https://github.com/user-attachments/assets/232772c1-d7fd-4385-b7cd-bb3de45e6f6d)

The course values of carrier Doppler frequency and code phase of the satellite signals are summarized in the below table:

| Satellite PRN | Doppler Frequency (Hz) | Code Phase |
|-----------------|-----------------|-----------------|
| 16	| -240.402	| 31994 |
| 26	| 1916.809	| 57754 |
| 31	| 1066.370	| 18744 |
| 22	| 1571.102	| 55101 |
| 27	| -3220.396	| 8814 |

### Task 1 Results for Urbany Dataset

The satellites visible to the user’s antenna is summarized in the plot "Acquisition results".

![Acquisition](https://github.com/user-attachments/assets/0f6c64e4-c119-46f8-9ca8-e76a8372577a)

The sky plot is shown in the below figure:

![SkyPlot](https://github.com/user-attachments/assets/4cb31ffb-9c0b-47ac-8850-d3975070fd64)

The acquisition results is shown in the plot "3D Acquisition Results".

![Acquisition_plot](https://github.com/user-attachments/assets/ee0e5fec-20af-47b8-bfa3-2a5de478546b)

| Satellite PRN | Doppler Frequency (Hz) | Code Phase |
|-----------------|-----------------|-----------------|
| 1	| 1202.583	| 3329	| 
| 3	| 4289.627	| 25173	| 
| 11	| 409.126	| 1155	| 
| 18	| -322.342	| 10581	| 

## Task 2: Adapt the tracking loop (DLL) to generate correlation plots and analyze the tracking performance. Discuss the impact of urban interference on the correlation peaks.

The datasets are run according to the configuration specified in the Preliminaries section. The correlation performance for each satellite can be obtained by running `plotTracking(1:settings.numberOfChannels, trackResults, settings);` in the command window. The correlation plot can be obtained by running Plots.m.

The tracking loop is implemented in the file tracking.m with multiple correlators of spacing 0.1 chip per each correlator from -0.5 chip to 0.5 chip. Please refer to the file tracking.m for the codes on implementing DDL tracking loop and the multiple correlators.

### Task 2 Result and Tracking Performance on Opensky Dataset

The tracking result for the satellite PRN31 (Channel 3) is taken as an example which is shown in the below figure:

![Task2_Ch3PRN31](https://github.com/user-attachments/assets/21ed86e9-316a-4a92-b7de-9fb0de236406)

The correlation plot is shown in the below figure:

![CorrelationPlot(new)](https://github.com/user-attachments/assets/a9d0c89b-1e27-4eda-851d-7d8f01e6515c)

A sharp peak can be observed in the correlation plot while the early and late correlation output can be kept in a high extent. In other words, the signal is tracked well.

### Task 2 Result and Tracking Performance on Opensky Dataset

The tracking result for the satellite PRN1 (Channel 1) is taken as an example which is shown in the below figure:

![Task2_Ch1PRN1](https://github.com/user-attachments/assets/6fff2111-53c4-4415-9d58-df236ab1525d)

The correlation plot is shown in the below figure:

![Correlation](https://github.com/user-attachments/assets/639e9e32-6c23-4c0c-b770-0e27ba46cb0f)

With the increasing value of code delay from the value of code delay = 0, the correlator output should keep decreasing. However, from code delay of 0.2 to code delay of 0.3, the decrease in the correlator output is almost zero. It implies that the peak of the correlator output is distorted in this dataset. The tracking performance is relatively worse.

### Discussion the impact of urban interference on the correlation peaks

From the plots of the correlator output of the Opensky and Urban datasets and the above discussions, one can observe that the correlator output has a sharp peak in the Opensky dataset while the Urban dataset has a distorted correlation peak. The reason of the distorted correlation peak in Urban dataset may be due to the multi-path in which some signals are reflected from the buildings, and the reflected signals travel for a longer distance than the line-of-sight signals in order to reach the user's antenna. Hence, these reflected signals arrive at the users after the line-of-sight signals have arrived at the user's antenna, which would probably result in the observation that the late correlation output in Urban dataset is larger than the Opensky dataset.

## Task 3: Decode the navigation message and extract key parameters, such as ephemeris data, for at least one satellite.

The datasets are run according to the configuration specified in the Preliminaries section. After running the file init.m for each dataset, the navigation message is decoded by calling the function stored in the files postNavigation.m, NAVdecoding, and ephemeris.m. The raw message bits can be obtained accordingly while the key parameters such as ephemeris data can be retrieved via the variable eph, which contains the ephemeris data for satellites.

### Task 3 Result on Opensky Dataset

The raw message bits are shown in the below figure (The message from PRN31 in Channel 3 is taken as an example):

![image](https://github.com/user-attachments/assets/9bde389d-ab3e-4e47-a3e3-0ffdac900870)

The ephemeris data of the satellites are summarized in the below table (Field 16 corresponds to the satellite PRN16; Field 22 corresponds to the satellite PRN22; Field 26 corresponds to the satellite PRN26; Field 27 corresponds to the satellite PRN27; Field 31 corresponds to the satellite PRN31):

![image](https://github.com/user-attachments/assets/5cec22ef-f3c6-4e2e-92a5-651233ddca46)

### Task 3 Result on Urban Dataset

The raw message bits are shown in the below figure (The message from PRN1 in Channel 1 is taken as an example):

![image](https://github.com/user-attachments/assets/4cfb6bc5-5cc7-4c35-aa27-ba8f3dab0081)

The ephemeris data of the satellites are summarized in the below table (Field 1 corresponds to the satellite PRN1; Field 3 corresponds to the satellite PRN3; Field 11 corresponds to the satellite PRN11; Field 18 corresponds to the satellite PRN18):

![image](https://github.com/user-attachments/assets/cfe55b6d-f088-4d63-8e19-0b59ebbd1ae6)

## Task 4: Using pseudorange measurements from tracking, implement the Weighted Least Squares (WLS) algorithm to compute the user's position and velocity. Plot the user position and velocity. Compare the results with the ground truth. Discuss the impact of multipath effects on the WLS solution.

The datasets are run according to the configuration specified in the Preliminaries section. The user position can be determined by running init.m while running Plots.m can provide the user velocity. The pseudorange measurements are processed in the functions in the file postNavigation.m while the WLS algorithm is stored in leastSquarePos.m, which will be called by postNavigation.m upon execution.

### Task 4 Result on Opensky Dataset: User Position and Velocity and Comparison of the User Position with the Ground Truth

The calculated user's antenna position is determined to be (22°19'42.3835",114°10'16.9629"), which is equivalent to (22.3284, 114.1714) in decimal format. Note that the calculated user's antenna position is the same as the ground truth coordinate of (22.3284, 114.1714) (correct to 4 decimal places). The calculated user's antenna position is summarized in the following figure:

![image](https://github.com/user-attachments/assets/fc6a9a78-190a-4079-abb9-a497f61cbd2d)

The user's antenna velocity is summarized in the following figure:

![Velocity](https://github.com/user-attachments/assets/c49b5566-bce7-4ae1-9070-276ce8858638)

### Task 4 Result on Urban Dataset: User Position and Velocity and Comparison of the User Position with the Ground Truth

The calculated user's antenna position is determined to be (22°19'10.4142",114°12'27.3914"), which is equivalent to (22.3196, 114.2076) in decimal format (correct to 4 decimal places), which deviates from the ground truth coordinate of (22.3199, 114.2091) (correct to 4 decimal places) by 157.9 meters. The calculated user's antenna position is summarized in the following figure:

![image](https://github.com/user-attachments/assets/8de4c8bf-4371-44d4-a93b-69d9092e6b45)

The user's antenna velocity is summarized in the following figure:

![Velocity](https://github.com/user-attachments/assets/3c2f84d0-6ed1-42dd-ab0a-68e872ba83b2)

### Discussion on the impact of multipath effects on the WLS solution

From the above discussion, the calculated user's antenna position is the same as the ground truth coordinate in the Opensky dataset, while a significant deviation between the calculated user's antenna position and the ground truth coordinate can be observed in the Urban dataset. In other words, the multi-path (due to the reflection of GPS signals from tall buildings) make the multi-path signals travel longer than the line-of-sight signals. Hence, it degrades the accuracy in determining the position of the user's antenna. Furthermore, due to the multipath signals, the user may guess that the user's antenna position change frequently when multipath signals arrive at the antenna just after the line-of-sight signals arrive at the antenna, making the velocity of the user's antenna velocity is unrelistically high (reaching the speed in the order of 1000 m/s, much faster than the speed of sound) in Urban dataset. Meanwhile, the value of the velocity in the Opensky dataset tends to be realistic. The multipath effect may also make the velocity estimate unstable (such as the sudden drop of velocity in t=3s). 

Furthermore, the degraded accuracy due to multipath effects can be explained by the fact that E=L is always being tried to be achieved in the traditional scalar tracking loops. Hence, multi-path usually leads to a bias in prompt tracking point, resulting in the range measurement errors. Therefore, the significant deviation between the estimated user’s position (in WLS solution) and the actual position from the ground truth coordinate can be observed if multi-path effects occur.

## Task 5: Develop an Extended Kalman Filter (EKF) using pseudorange and Doppler measurements to estimate user position and velocity.

The datasets are run according to the configuration specified in the Preliminaries section. When the file init.m is run, the EKF algorithm stored in the file ekf.m is called to estimate the user's position and velocity. The plot on user's position will be generated accordingly. To generate the user's antenna velocity with the incorporation of EKF algorithm, Plots.m is executed accordingly.

### Task 5 Result on Opensky Dataset

The calculated user's antenna position is determined to be (22°19'42.4086",114°10'16.9747"), which is equivalent to (22.3284, 114.1714) in decimal format (correct to 4 decimal places), which is the same as the ground truth coordinate of (22.3284, 114.1714) (correct to 4 decimal places). This result is similar to the result in Task 4 because the calculated user's antenna position in Task 4 is highly accurate, so the room for improvement by the adoption of EKF algorithm is probably very small. Hence, the difference of calculated user's antenna positions between Task 4 and Task 5 is very small. The calculated user's antenna position is summarized in the following figure:

![image](https://github.com/user-attachments/assets/c795533e-0496-438c-ab03-df8d10a091ad)

The user's antenna velocity is summarized in the following figure:

![EKF velocity](https://github.com/user-attachments/assets/8a11b5d1-1a6a-4866-b86a-ca754dbb1e77)

### Task 5 Result on Urban Dataset

The calculated user's antenna position is determined to be (22°19'13.2525",114°12'30.3869"), which is equivalent to (22.3203, 114.2084) in decimal format (correct to 4 decimal places), which deviates from the ground truth coordinate of (22.3199, 114.2091) (correct to 4 decimal places) by 84.6 meters. Compared to the result in Task 4, the deviation between the calculated user's antenna position and the ground truth coordinate is reduced by 46.42% after the incorporation of the EKF algorithm. In other words, the EKF algorithm can improve the accuracy in determining the user's antenna position. The calculated user's antenna position is summarized in the following figure:

![image](https://github.com/user-attachments/assets/d88302e2-8913-4899-bef8-0165f81c7e0c)

The user's antenna velocity is summarized in the following figure:

![EKF_velocity](https://github.com/user-attachments/assets/0a24b7ab-a0d2-419a-9ed1-ca213d5876b1)

Compared to the result in Task 4, the magnitude of the user's antenna velocity is in a relatively realistic value (in the order between 10 m/s and 100 m/s), which implies that the multipath effect can be mitigated in some extent. Furthermore, compared to Task 4, the estimated velocity value tends to be more stable because a sudden change in velocity magnitude can hardly be observed when EKF algorithm is adopted.
