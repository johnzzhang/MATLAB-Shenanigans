x = linspace(0,100,1000);
data = sin(x/(2*3.14))+3;
highpass_data = zeros(1,1000);

dt = 50/10^6;
RC = 1;
a = RC / dt;

for n=2:1000
    highpass_data(n) = a/(a+1) * (highpass_data(n-1)+data(n)-data(n-1));
end

hold on;
plot(x,data);
plot(x,highpass_data);