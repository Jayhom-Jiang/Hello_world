clear, clc, close all
%% ��������
%% ���ݼ��ؼ��ϲ�

%% ����h5���ݿ�
GroupNum = 32;  % ���������Ŀ==���ݿ�ķ�����Ŀ
h5ID = './DataSet_224_32_stft.h5';  % ����h5���ݿ�洢λ�ú��ʼ�����
% ���������ά�Ȳ���
W = 224;  % ͼƬ�ĳ�
H = 224;  % ͼƬ�Ŀ�
C = 2;  % ͼƬ��ͨ����Ŀ
GroupSize = [W, H, C, Inf];  % �����Ƕ�̬����ռ䣬TotalNum��һ��ά�����ó����޴󼴣�[W, H, C, Inf]
ChunkSize = [W H C 1];  % �������ݿ�ķֿ��С�ߴ磬Ҳ����һ�������ĳߴ�
DataType = 'double';  % ���ô洢�����ݾ��ȣ�����ʹ���˸�����
Deflate = 0;  % ��������ѹ���ĵȼ���ʹ��gzipѹ����ʽ������Ĭ�ϲ�����ѹ��
% �������ݿ��ͬʱ��������,���������Ϊ, '1', '2'...'8', '9'
CreateDataSet( h5ID, GroupNum, GroupSize, ChunkSize, DataType, Deflate );

