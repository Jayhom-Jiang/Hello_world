clc
clear
%Ҫ������������
classlist=[201608003,201608007,201608009,201608018,201608033,201608034,201608035,201608037];
%Ҫ�����Ƶ��
frequelist=[225,300,380,450,512];
%��Ӧ���ʵ����� ��ߴ������512���ʵ�����
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
num = 203000;%һ�ζ������ݸ���
% ���������ά�Ȳ���
W = 224;  % ͼƬ�ĳ�
H = 224;  % ͼƬ�Ŀ�
C = 2;  % ͼƬ��ͨ����Ŀ
win_sz = 448;  % ����������
noverlap = win_sz - 45;  % �����ظ�����
nfft = 448;  % fft�ĵ�����Ƶ�ʷֱ���
figure_num = 0;%��ǰ��ȡ����������
data_number = 4000;%ÿһ����Ҫ��������
for i = 3%:1:length(classlist)
    for j = 5%:1:length(frequelist)%���ڵ�һ�����ݴ�ʱ���Ͽ�Ч�������ã����Դ�2��ʼ
        d = [ './',num2str(classlist(i)),'/Fs3840000_Fc',num2str(frequelist(j)*10^6)...
                 ,'_Bw2000000_IQ_',num2str(namelist(i,j)), '.mat'] 
        data=cell2mat(struct2cell(load(d)));
        while figure_num <= data_number-1

            data_index = data(index:index+num-1);
            [data_STFT, ~, ~] =  spectrogram(data_index,win_sz,noverlap,nfft,[]);
            data_STFT_Real = real(data_STFT);
            data_STFT_Imag = imag(data_STFT);
            % ��ͼ�鿴
            % figure,subplot(2,1,1),imagesc(abs(valid_data_STFT_Real)),subplot(2,1,2), imagesc(abs(valid_data_STFT_Imag))
            % ��26000 - 256��/ 10 = 2574 2574 / 128 = 20 ����һ��֡����ȡ4��ͼƬ
            % ʹ��ѭ����ȡ128 * 128 ��Ƶ��ͼƬ
             for k = 1 : 1 : 20
                 tempI =  data_STFT_Real(1:224, (k-1)*224+1:k*224).';
                 tempQ =  data_STFT_Imag(1:224, (k-1)*224+1:k*224).';                
                 % ƴ�ӳ���ά����
                 temp = cat(3, tempI, tempQ);
                 data_fin(1:W,1:H,1:C,figure_num+1) = temp;
                 % ����ͼƬ��Ŀ
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
          

