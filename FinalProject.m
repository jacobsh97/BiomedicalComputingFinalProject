clear all;
clc;

totalsteps = input('Enter the total number of steps you would like for the day: ');
loop = true;
m = mobiledev;
m.AccelerationSensorEnabled = 1;
m.Logging = 1;
display('start');
a = arduino();
configurePin(a,'D7','pullup');


while(loop)
    
    if(readDigitalPin(a,'D7') == 0)
        
        display('calculating');
        pause(1);
        [acceleration, t] = accellog(m);
        
        plot(t,acceleration);
        legend('x','y','z');
        
        x = acceleration(:,1)';
        y = acceleration(:,2)';
        z = acceleration(:,3)';
        acc = sqrt(x.^2)+sqrt(y.^2)+sqrt(z.^2);
        
        sdsum = std(acc);
        
        figure(2);
        [peaks,locs,w,p] = findpeaks(acc,'MinPeakHeight',sdsum);
        findpeaks(acc,'MinPeakHeight',sdsum,'Annotate','extents');
        
        sum = 0;
        for(i = 1:length(p))
            if(p(i) > 5.8)
                sum = sum+1;
            end
        end
        
        sum
        percentcomplete = sum/totalsteps;
        percentcomplete;
        
        if(percentcomplete >= 0.25)
            writeDigitalPin(a,2,1);
            pause(.25);
        end
        if(percentcomplete >= 0.5)
            writeDigitalPin(a,3,1);
            pause(.25);
        end
        if(percentcomplete >= 0.75)
            writeDigitalPin(a,4,1);
            pause(.25);
        end
        if(percentcomplete >= 1)
            writeDigitalPin(a,5,1);
            pause(.25);
        end
        pause(1);
        
        writeDigitalPin(a,2,0);
        writeDigitalPin(a,3,0);
        writeDigitalPin(a,4,0);
        writeDigitalPin(a,5,0);
        
    end
    
end












