clc
clear
close all

%% load data
load('jacobEKG.mat')
ekgjacob = data;

testmaaling = ekgjacob(1:5000);
%testmaaling = ekgjacob;
%% Opstil varianter

Fs = 1000; %1000hz
sampletid = length(testmaaling)/Fs; %5sek
t = (0:length(testmaaling)-1)/Fs;
L = length(testmaaling);

filterData = zeros(size(L));


%% R� fig

figure
plot (t,testmaaling)
ylabel('Voltage')
xlabel('Time (s)')
title ('ECG Signal r�')

%% 50 HZ
d = designfilt('bandstopiir','FilterOrder',2,'HalfPowerFrequency1',49,'HalfPowerFrequency2',51,'DesignMethod','butter','SampleRate',Fs);

%testmaaling = filtfilt(d,testmaaling);
testmaaling = testmaaling - mean(testmaaling);

%% Highpass butter
for i = 0:3
    %     knekfrekvens = 0.5*(2.^i);
    %
    %     figure
    %     sgtitle('Butterworth' + " - Knekfrekvens " + string(knekfrekvens)+" Hz" )
    %     for j = 1:9
    %         %Filterorden
    %
    %         xbuffer = zeros(j+1);
    %         y = zeros(j+1);
    %         [H1,H2] = butter(j,knekfrekvens/(Fs/2),'high');
    %
    %         for g = j+2:L
    %             xbuffer(1) = testmaaling(g);
    %             y(1) = H1(1)*xbuffer(1);
    %             for h = 1:j+1
    %
    %                 y(1) = y(1) + (H1(h)* xbuffer(h) - H2(h)*y(h));
    %
    %             end
    %             for h = j:-1:1
    %                 y(h+1) = y(h);
    %                 xbuffer(h+1) = xbuffer(h);
    %
    %             end
    %             filterData(g) = y(1);
    %         end
    %
    %         subplot(3,3,j)
    %         plot (t,filterData)
    %         ylabel('Bitniveauer')
    %         xlabel('Time (s)')
    %         title ("Filterorden " + int2str(j))
    %
    %     end
    %
    %
end
%% Highpass Elliptic
for i = 0:3
%         knekfrekvens = 0.5*(2.^i);
%     
%         figure
%         sgtitle('Elliptic highpass' + " - Knekfrekvens " + string(knekfrekvens)+" Hz" + " - Rip pass 3 Rip stop 60" )
%         for j = 1:9
%             %Filterorden
%     
%             xbuffer = zeros(j+1);
%             y = zeros(j+1);
%             [H1,H2] = ellip(j,3,60,knekfrekvens/(Fs/2),'high');
%     
%             for g = j+2:L
%                 xbuffer(1) = testmaaling(g);
%                 y(1) = H1(1)*xbuffer(1);
%                 for h = 1:j+1
%     
%                     y(1) = y(1) + (H1(h)* xbuffer(h) - H2(h)*y(h));
%     
%                 end
%                 for h = j:-1:1
%                     y(h+1) = y(h);
%                     xbuffer(h+1) = xbuffer(h);
%     
%                 end
%                 filterData(g) = y(1);
%             end
%     
%             subplot(3,3,j)
%             plot (t,filterData)
%             ylabel('Bitniveauer')
%             xlabel('Time (s)')
%             title ("Filterorden " + int2str(j))
%     
%         end
%     
%     
end
%% Lowpass Elliptic
for i = 1:5
    %     knekfrekvens = 10*i;
    %
    %     figure
    %     sgtitle('Elliptic Low' + " - Knekfrekvens " + string(knekfrekvens)+" Hz" + " - Rip pass 3 Rip stop 60" )
    %     for j = 1:9
    %         %Filterorden
    %
    %         xbuffer = zeros(j+1);
    %         y = zeros(j+1);
    %         [H1,H2] = ellip(j,3,60,knekfrekvens/(Fs/2));
    %
    %         for g = j+2:L
    %             xbuffer(1) = testmaaling(g);
    %             y(1) = H1(1)*xbuffer(1);
    %             for h = 1:j+1
    %
    %                 y(1) = y(1) + (H1(h)* xbuffer(h) - H2(h)*y(h));
    %
    %             end
    %             for h = j:-1:1
    %                 y(h+1) = y(h);
    %                 xbuffer(h+1) = xbuffer(h);
    %
    %             end
    %             filterData(g) = y(1);
    %         end
    %
    %         subplot(3,3,j)
    %         plot (t,filterData)
    %         ylabel('Bitniveauer')
    %         xlabel('Time (s)')
    %         title ("Filterorden " + int2str(j))
    %
    %     end
    %
    %
end
%% B�nd butter
for i = 1:5
    %     knekfrekvens = 10*i;
    %
    %     figure
    %     sgtitle('Elliptic b�nd' + " - Knekfrekvens " + string(knekfrekvens)+" Hz" + " - Rip pass 3 Rip stop 60" )
    %     for j = 1:9
    %         %Filterorden
    %
    %         xbuffer = zeros(j+1);
    %         y = zeros(j+1);
    %         [H1,H2] = butter(j,[0.0002, 0.1000]);
    %
    %         for g = 2*(j+2):L
    %             xbuffer(1) = testmaaling(g);
    %             y(1) = H1(1)*xbuffer(1);
    %             for h = 1:j+1
    %
    %                 y(1) = y(1) + (H1(h)* xbuffer(h) - H2(h)*y(h));
    %
    %             end
    %             for h = j:-1:1
    %                 y(h+1) = y(h);
    %                 xbuffer(h+1) = xbuffer(h);
    %
    %             end
    %             filterData(g) = y(1);
    %         end
    %
    %         subplot(3,3,j)
    %         plot (t,filterData)
    %         ylabel('Bitniveauer')
    %         xlabel('Time (s)')
    %         title ("Filterorden " + int2str(j))
    %
    %     end
    %
    %
end

plotHeightPixel = 1080;
plotWidthPixel = 1920;
for k = 1:4
for i = 1:4
    knekfrekvensH = 0.25*(2.^i);
    knekfrekvensL = 10*k;    
    % Lav figur
    dataPlot = figure();
    % Set figur parametre
    set(dataPlot,'Units','pixels','Position',[0 0 plotWidthPixel plotHeightPixel])
    sgtitle("Butter b�ndpass" + " - F_H " + string(knekfrekvensH) + " Hz" + " - F_L " + string(knekfrekvensL) + " Hz" )
    for j = 1:6
        %Filterorden        
        xbuffer = zeros(j+1);
        y = zeros(j+1);
        [H1,H2] = butter(j,[knekfrekvensH/(Fs/2) knekfrekvensL/(Fs/2)],'bandpass');        
        for g = 2*j+1:L
            xbuffer(1) = testmaaling(g);
            y(1) = H1(1)*xbuffer(1);
            for h = 1:(2*j+1)                
                y(1) = y(1) + (H1(h)* xbuffer(h) - H2(h)*y(h));                
            end
            for h = 2*j:-1:1
                y(h+1) = y(h);
                xbuffer(h+1) = xbuffer(h);                
            end
            filterData(g) = y(1);           
        end
        subplot(2,3,j)
        plot (t,filterData)
        ylabel('Bitniveauer')
        xlabel('Tid [s]')
        title ("Filterorden " + int2str(j))
        filenamePNG = strcat("Butter bandpass"," - F_H ",string(knekfrekvensH),"_Hz","_F_L ",string(knekfrekvensL),"_Hz",".png"); 
        saveas(dataPlot, filenamePNG, 'png')
    end
end
end