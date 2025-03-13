function doppler=calculateDoppler(trackResults,currMeasSample,channelList,settings)

    for channelNumber = channelList 
        % measurment point location 
        for i = 1: length(trackResults(channelNumber).absoluteSample)
            if(trackResults(channelNumber).absoluteSample(i) > currMeasSample )
                break;
            end 
        end
        i = i - 1;
        carrFreq=trackResults(channelNumber).carrFreq(i);
        doppler(channelNumber)=(carrFreq-settings.IF)*settings.c/1575.42e6;
    end
end