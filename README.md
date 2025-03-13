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
| 1	| 1202.58331298828	| 3329	| 
| 3	| 4289.62707519531	| 25173	| 
| 11	| 409.126281738281	| 1155	| 
| 18	| -322.341918945313	| 10581	| 

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

The correlator output should keep decreasing with the increasing value of code delay from the value of code delay = 0. However, from code delay of 0.2 to code delay of 0.3, the decrease in the correlator output is almost zero. It implies that the peak of the correlator output is distorted in this dataset. The tracking performance is relatively worse.

### Discussion the impact of urban interference on the correlation peaks

From the plots of the correlator output of the Opensky and Urban datasets and the above discussions, one can observe that the correlator output has a sharp peak in the Opensky dataset while the Urban dataset has a distorted correlation peak. The reason of the distorted correlation peak in Urban dataset may be due to the multi-path in which some signals are reflected from the buildings, and the reflected signals travel for a longer distance than the line-of-sight signals before these signals are received by the user's antenna. Hence, these reflected signals arrive at the users after the line-of-sight signals have arrived at the user's antenna, which would probably result in the observation that the late correlation output in Urban dataset is larger than the Opensky dataset.

## Task 3: Decode the navigation message and extract key parameters, such as ephemeris data, for at least one satellite.

After running the file init.m for each dataset, the navigation message is decoded by calling the function stored in the file postNavigation.m, NAVdecoding, and ephemeris.m. The key parameters such as ephemeris data can be retrieved via the variable eph, which contains the ephemeris data for satellites.

### Task 3 Result on Opensky Dataset

The ephemeris data of the satellites are summarized in the below table (Fields 16 corresponds to the satellite PRN16; Fields 22 corresponds to the satellite PRN22; Fields 26 corresponds to the satellite PRN26; Fields 16 corresponds to the satellite PRN27; Fields 31 corresponds to the satellite PRN31):

![image](https://github.com/user-attachments/assets/5cec22ef-f3c6-4e2e-92a5-651233ddca46)

### Task 3 Result on Urban Dataset

The ephemeris data of the satellites are summarized in the below table (Fields 1 corresponds to the satellite PRN1; Fields 3 corresponds to the satellite PRN3; Fields 11 corresponds to the satellite PRN11; Fields 18 corresponds to the satellite PRN18):

![image](https://github.com/user-attachments/assets/cfe55b6d-f088-4d63-8e19-0b59ebbd1ae6)

## Task 4: Using pseudorange measurements from tracking, implement the Weighted Least Squares (WLS) algorithm to compute the user's position and velocity. Plot the user position and velocity. Compare the results with the ground truth. Discuss the impact of multipath effects on the WLS solution.



