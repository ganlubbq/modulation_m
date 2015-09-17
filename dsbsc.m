clear
echo on
t0=2;                         %�źų���ʱ��
ts=0.001;                    %�źų������
fc=100;                       %�ز�Ƶ��
fs=1/ts;                      
df=0.3;                      %Ƶ�ʷֱ���
t=[-t0/2:ts:t0/2];           %����ʱ������ 
%��������Ϊ�����ź�����
x=sin(200*t);                
m=x./(200*t);
m(1001)=1;                     %�������������ֵ
c=cos(2*pi*fc.*t);             %�ز�
u=m.*c;                        %�����ز�����
[M,m,df1]=fftseq(m,ts,df);      %����Ҷ�任
M=M/fs;
[U,u,df1]=fftseq(u,ts,df);      %����Ҷ�任
U=U/fs;                         %Ƶ��ѹ��     
f=[0:df1:df1*(length(m)-1)]-fs/2;
pause
clf
subplot(2,2,1)
plot(t,m(1:length(t)))             %����δ���źŵĲ���
axis([-0.4,0.4,-0.5,1.1])
xlabel('ʱ��');
title('δ���ź�');
pause;                          %��ͣ���򣬴����������ִ��
subplot(2,2,3)                  
plot(t,c(1:length(t)))
axis([-0.1,0.1,-1.5,1.5]);
xlabel('ʱ��');
title('�ز�');
pause
subplot(2,2,2)
plot(t,u(1:length(t)))
axis([-0.2,0.2,-1,1.2]);
xlabel('ʱ��')
title('�ѵ��ź�');
pause
subplot(2,1,1)
plot(f,abs(fftshift(M)))
xlabel('Ƶ��');
title('δ���źŵ�Ƶ��')
subplot(2,1,2)
plot(f,abs(fftshift(U)))
title('�ѵ��źŵ�Ƶ��');
xlabel('Ƶ��')