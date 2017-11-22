clear all;
clc;

a = arduino();
m = mobiledev;

m.AccelerationSensorEnabled = 1;
m.Logging = 1;

pause(5);

m.Logging = 0;

[acceleration, t] = accellog(m);

plot(t,acceleration);
legend('x','y','z');








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








