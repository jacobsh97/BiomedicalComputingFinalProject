clear all;
clc;

% a = arduino();
m = mobiledev;

m.AccelerationSensorEnabled = 1;
m.Logging = 1;

pause(5);
display('stop');

m.Logging = 0;
m.AccelerationSensorEnabled = 0;
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
    if(p(i) > std(p))
        sum = sum+1;
    end
end

sum
% for(i = 1:10)
%     writeDigitalPin(a,2,1);
%     pause(1);
%     writeDigitalPin(a,3,1);
%     pause(1);
%     writeDigitalPin(a,4,1);
%     pause(1);
%     writeDigitalPin(a,5,1);
%     pause(1);
%     writeDigitalPin(a,2,0);
%     pause(1);
%     writeDigitalPin(a,3,0);
%     pause(1);
%     writeDigitalPin(a,4,0);
%     pause(1);
%     writeDigitalPin(a,5,0);
%     pause(1);
% end








