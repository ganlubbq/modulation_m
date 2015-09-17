close all;
clear all;
dt=0.001;fm=1;fc=2.5;
T=5;
%fs=32;       %信号采样频率 
t=0:dt:T;
%fsc=40;
mt=sqrt(2)*cos(2*pi*fm*t);
A=2;
s_ssb=real(hilbert(mt).*exp(j*2*pi*fc*t));
B=2*fm;
figure(1)
subplot(311)
plot(t,s_ssb);hold on;
plot(t,mt,'r--');
title('ssb调制信号');
xlabel('t');
%ssb modulation
rt=s_ssb.*cos(2*pi*fc*t); %相干解调
rt=rt-mean(rt);
[f,rf]=T2F(t,rt);
[t,rt]=lpf(f,rf,B);
subplot(312)
plot(t,rt);hold on;
plot(t,mt/2,'r--');
title('相干解调后的信号波形与输入信号的比较');
xlabel('t');
subplot(313)
[f,sf]=T2F(t,s_ssb);%单边带信号频谱
psf=(abs(sf).^2)/T;
plot(f,psf);
axis([-2*fc 2*fc 0 max(psf)]);
title('ssb信号的功率谱');
xlabel('f')

