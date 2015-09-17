echo on
t0=.15;
ts=1/1500;
fc=250;
fs=1/ts;
df=0.25;
t=[0:ts:t0];
m=[ones(1,t0/(3*ts)),-2*ones(1,t0/(3*ts)),zeros(1,t0/(3*ts)+1)];
c=cos(2*pi*fc.*t);
udsb=m.*c;
[UDSB,udsb,df1]=fftseq(udsb,ts,df);
UDSB=UDSB/fs;
n2=ceil(fc/df1);
UDSB(n2:length(UDSB)-n2)=zeros(size(UDSB(n2:length(UDSB)-n2)));
ULSSB=UDSB;
[M,m,df1]=fftseq(m,ts,df);
M=M/fs;
f=[0:df1:df1*(length(M)-1)]-fs/2;
u=real(ifft(ULSSB))*fs;
y=u.*cos(2*pi*fc*[0:ts:ts*(length(u)-1)]);
[Y,y,df1]=fftseq(y,ts,df);
Y=Y/fs;
f_cutoff=150;
n_cutoff=floor(150/df);
H=zeros(size(f));
H(1:n_cutoff)=4*ones(1,n_cutoff);
H(length(f)-n_cutoff+1:length(f))=4*ones(1,n_cutoff);
DEM=H.*Y;
dem=real(ifft(DEM))*fs;
pause
clf
subplot(3,1,1)
plot(f,fftshift(abs(M)))
xlabel ('Ƶ��')
title('�����ź�Ƶ��')
subplot(3,1,2)
plot(f,fftshift(abs(ULSSB)))
title('�ز�Ƶ��')
xlabel ('Ƶ��')
subplot(3,1,3)
plot(f,fftshift(abs(Y)))
title('���ƺ���ź�Ƶ��')
xlabel ('Ƶ��')
pause
clf
subplot(3,1,1)
plot(f,fftshift(abs(Y)))
xlabel ('Ƶ��')
title('���ƺ���ź�Ƶ��')
subplot(3,1,2)
plot(f,fftshift(abs(H)))
title('��ͨ�˲���Ƶ��')
xlabel ('Ƶ��')
subplot(3,1,3)
plot(f,fftshift(abs(DEM)))
title('�������ź�Ƶ��')
xlabel ('Ƶ��')
pause
subplot(2,1,1)
plot(t,m(1:length(t)))
xlabel ('Time')
title('ԭ�ź�')
subplot(2,1,2)
plot(t,dem(1:length(t)))
title('�������ź�')
xlabel ('ʱ��')

