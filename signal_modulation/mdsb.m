close all;
clear all;
dt=0.001;  %ʱ��������            
fm=1;       %�ź����Ƶ��
%fs=32;       %�źŲ���Ƶ��   
fc=2.5;      %�ز�Ƶ��
T=5;        %�ź�ʱ��
t=0:dt:T;   %ʱ����
%fsc=40;     %�ز�����Ƶ��
mt=sqrt(2)*cos(2*pi*fm*t);
%N0=0.01;
%DSB modulation 
s_dsb=mt.*cos(2*pi*fc*t);
B=2*fm;
figure(2)
subplot(311)
plot(t,s_dsb);hold on;
plot(t,mt,'r--');title('DSB�����ź�');
xlabel('t')
%DSB demodulation
rt=s_dsb.*cos(2*pi*fc*t);
rt=rt-mean(rt);
[f,rf]=T2F(t,rt);
[t,rt]=lpf(f,rf,B);
subplot(312)
plot(t,rt);hold on;
plot(t,mt/2,'r--');
title('��ɽ������źŲ����������źŵıȽ�')
xlabel('t')
subplot(313)
[f,sf]=T2F(t,s_dsb);
psf=(abs(sf).^2)/T;
plot(f,psf);
axis([-2*fc 2*fc 0 max(psf)]);
title('DSB�źŹ�����')
xlabel('f');grid



