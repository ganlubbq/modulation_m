close all;
clear all;
dt=0.001;fm=1;fc=2.5;
T=5;
%fs=32;       %�źŲ���Ƶ�� 
t=0:dt:T;
%fsc=40;
mt=sqrt(2)*cos(2*pi*fm*t);
A=2;
s_am=(A+mt).*cos(2*pi*fc*t);
B=2*fm;
figure(1)
subplot(311)
plot(t,s_am);hold on;
plot(t,A+mt,'r--');
title('AM�����źż������');
xlabel('t');
%AM modulation
rt=s_am.*cos(2*pi*fc*t); %��ɽ��
rt=rt-mean(rt);
[f,rf]=T2F(t,rt);
[t,rt]=lpf(f,rf,B);
subplot(312)
plot(t,rt);hold on;
plot(t,mt/2,'r--');
title('��ɽ������źŲ����������źŵıȽ�');
xlabel('t');
subplot(313)
[f,sf]=T2F(t,s_am);%�����ź�Ƶ��
psf=(abs(sf).^2)/T;
plot(f,psf);
axis([-2*fc 2*fc 0 max(psf)]);
title('AM�źŵĹ�����');
xlabel('f')
