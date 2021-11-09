clc
clear
%要处理的类的名字
classlist=[201608003,201608007,201608009,201608018,201608033,201608034,201608035,201608037];
%要处理的频率
frequelist=[225,300,380,450,512];
%对应码率的名字 这边处理的是512码率的数据
%201608003
namelist(1,:)=[20181101150540,20181101151822,20181101161835,20181101162746,20181101163550];
%201608007
namelist(2,:)=[20181106132907,20181106133550,20181106134250,20181106135020,20181106135646];
%201608009
namelist(3,:)=[20181031134825,20181031135742,20181031140455,20181031141142,20181031141941];
%201608018
namelist(4,:)=[20181102150620,20181102152415,20181102153436,20181102154110,20181102154750];
%201608033
namelist(5,:)=[20181106151155,20181106151826,20181106152512,20181106153342,20181106154046];
%201608034
namelist(6,:)=[20181105160140,20181105161015,20181105161710,20181106082035,20181106082816];
%201608035
namelist(7,:)=[20181101174845,20181101175830,20181101191925,20181102091831,20181102093340];
%201608037
namelist(8,:)=[20181102110930,20181102134101,20181102134825,20181102135520,20181102140710];


index=1;
num = 203000;%一次读入数据个数
% 设置输出的维度参数
W = 224;  % 图片的长
H = 224;  % 图片的宽
C = 2;  % 图片的通道数目
win_sz = 448;  % 滑动窗长度
noverlap = win_sz - 45;  % 窗的重复点数
nfft = 448;  % fft的点数，频率分辨率
figure_num = 0;%当前获取到的样本数
data_number = 4000;%每一类需要的样本数
for i = 3%:1:length(classlist)
    for j = 5%:1:length(frequelist)%由于第一个数据从时域上看效果并不好，所以从2开始
        d = [ './',num2str(classlist(i)),'/Fs3840000_Fc',num2str(frequelist(j)*10^6)...
                 ,'_Bw2000000_IQ_',num2str(namelist(i,j)), '.mat'] 
        data=cell2mat(struct2cell(load(d)));
        while figure_num <= data_number-1

            data_index = data(index:index+num-1);
            [data_STFT, ~, ~] =  spectrogram(data_index,win_sz,noverlap,nfft,[]);
            data_STFT_Real = real(data_STFT);
            data_STFT_Imag = imag(data_STFT);
            % 绘图查看
            % figure,subplot(2,1,1),imagesc(abs(valid_data_STFT_Real)),subplot(2,1,2), imagesc(abs(valid_data_STFT_Imag))
            % （26000 - 256）/ 10 = 2574 2574 / 128 = 20 所以一个帧能提取4张图片
            % 使用循环提取128 * 128 的频谱图片
             for k = 1 : 1 : 20
                 tempI =  data_STFT_Real(1:224, (k-1)*224+1:k*224).';
                 tempQ =  data_STFT_Imag(1:224, (k-1)*224+1:k*224).';                
                 % 拼接成三维矩阵
                 temp = cat(3, tempI, tempQ);
                 data_fin(1:W,1:H,1:C,figure_num+1) = temp;
                 % 更新图片数目
                 figure_num = figure_num + 1;
             end
             index = index + num;
             figure_num 
        end
        h5write('DataSet_224_32_stft.h5',['/',num2str(classlist(i)),'_',num2str(frequelist(j))],data_fin,[1,1,1,1],size(data_fin));
        figure_num = 0;
        index = 1;
    end
end
          

