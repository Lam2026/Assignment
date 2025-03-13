# Assignment

## Preliminary:

The configurations of running the dataset are contained in initSetting.m, and the major differences between running the Opensky and Urban datasets in initSetting.m are on the file path and the values of IF frequency and sampling frequency. For Opensky dataset, the settings on the file path and the values of IF frequency and sampling frequency are:

```settings.fileName           = 'C:\Users\owner\Documents\MATLAB\GPS\Opensky.bin';
settings.IF                 = 1580e6-1575.42e6;     % [Hz]
settings.samplingFreq       = 58e6; % [Hz]```

Meanwhile, for the Urban dataset, the settings on the file path and the values of IF frequency and sampling frequency are:

```settings.fileName           = 'C:\Users\owner\Documents\MATLAB\GPS\Urban.bin';
settings.IF                 = 10e6;     % [Hz]
settings.samplingFreq       = 26e6; % [Hz]```
