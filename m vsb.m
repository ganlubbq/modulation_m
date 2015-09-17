close all;
clear all; %�����ʷ��¼
dt=0.001; %ʱ��������
fm=5; %��Դ���Ƶ��
fc=20; %�ز�����Ƶ��
T=5;  %�ź�ʱ��
t=0:dt:T;
mt=sqrt(2)*(cos(2*pi*fm*t)+sin(2*pi*0.5*fm*t));
%VSB modulation  %�����ߴ���������
s_vsb=mt.*cos(2*pi*fc*t);
B=1.2*fm;  %��ͨ�˲�������
[f,sf]=T2F(t,s_vsb);
[t,s_vsb]=vsbpf(f,sf,0.2*fm,1.2*fm,fc);
figure(1)  %���ɵ�һ��ͼ
subplot(311)  %����һ��ͼ����3��1������ȡ��һ��
plot(t,s_vsb);hold on; %����VSB�źŲ���
plot(t,mt,'r--');  %��ʾmt�Ĳ���
title('VSB�����ź�');%����
xlabel('t'); %X�����Ϊt
%VSB demodulation
rt=s_vsb.*cos(2*pi*fc*t);
[f,rf]=T2F(t,rt);  %ʱ���Ƶ�򣬸���Ҷ�任
[t,rt]=lpf(f,rf,2*fm);%��ɽ���󣬵�ͨ�˲�
subplot(312)  %������ͼ
plot(t,rt);hold on; %��������
plot(t,mt/2,'r--') %��ʾmt/2���źŲ��Σ���Ƶ��ͼ
title('��ɽ������źŲ����������źŵıȽ�')
xlabel('t') %������Ϊʱ��
subplot(313) %����������3��1�е�ͼ
[f,sf]=T2F(t,s_vsb); %������źŵĹ���Ƶ��ͼ������Ҷ�任��
psf=(abs(sf).^2)/T; %��psf����
plot(f,psf);
axis([-2*fc 2*fc 0 max(psf)]);
title('VSB�źŹ�����');
xlabel('f');
function[t,st]=vsbpf(f,sf,B1,B2,fc)
%This function filter an input data using a lowpass filter
%Inputs:f:frequency samples
%       sf:input data spectrum samples
%       B:lowpass's bandwidth with a rectangle lowpass
%Outputs:t:time samples
%        st:output data's time samples
df=f(2)-f(1);
T=1/df;
hf=zeros(1,length(f));
bf1=[floor((fc-B1)/df):floor((fc-B1)/df)];
bf2=[floor((fc+B1)/df)+1:floor((fc+B2)/df)];
f1=bf1+floor(length(f)/2);
f2=bf2+floor(length(f)/2);
stepf=1/length(f1);
hf(f1)=0:stepf:1-stepf;
hf(f2)=1;
f3=-bf1+floor(length(f)/2);
f4=-bf2+floor(length(f)/2);
hf(f3)=0:stepf:(1-stepf);
hf(f4)=1;
yf=hf.*sf;
[t,st]=F2T(f,yf);
st=real(st);