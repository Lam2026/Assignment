# Assignment

## Preliminary:

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

The correlation performance for each satellite can be obtained by running `plotTracking(1:settings.numberOfChannels, trackResults, settings);` in the command window. The correlation plot can be obtained by running Plots.m.
