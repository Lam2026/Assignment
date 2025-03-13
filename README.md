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

To process the datasets, the file init.m is first run. Then, the plot "Acquisition results" is generated while the course values of carrier frequency and code phase of the satellite signals can be determined in the data stored under the variable "channel" in the Workspace. The Doppler frequency can be determined by minus the value of 4.58e6 (for Opensky dataset) or XXX (for Urban dataset). To generate the plot "3D Acquisition Results", the file Plots.m is run afterwards.

### Task 1 Results for Opensky Dataset

The satellites visible to the user’s antenna is summarized in the plot "Acquisition results".

![Acquisition](https://github.com/user-attachments/assets/1d2d12d5-6940-49f0-aa6a-1369ffe4defd)

The acquisition results is shown in the plot "3D Acquisition Results".

![Acquisition plot](https://github.com/user-attachments/assets/232772c1-d7fd-4385-b7cd-bb3de45e6f6d)

| Column 1 Header | Column 2 Header | Column 3 Header |
|-----------------|-----------------|-----------------|
| Row 1, Cell 1   | Row 1, Cell 2   | Row 1, Cell 3   |
| Row 2, Cell 1   | Row 2, Cell 2   | Row 2, Cell 3   |
| Row 3, Cell 1   | Row 3, Cell 2   | Row 3, Cell 3   |
