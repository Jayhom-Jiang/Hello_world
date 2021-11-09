clear, clc, close all
%% 程序主体
%% 数据加载及合并

%% 创建h5数据库
GroupNum = 32;  % 定义分类数目==数据库的分组数目
h5ID = './DataSet_224_32_stft.h5';  % 定义h5数据库存储位置和问价名称
% 设置输出的维度参数
W = 224;  % 图片的长
H = 224;  % 图片的宽
C = 2;  % 图片的通道数目
GroupSize = [W, H, C, Inf];  % 由于是动态分配空间，TotalNum那一个维度设置成无限大即：[W, H, C, Inf]
ChunkSize = [W H C 1];  % 设置数据库的分块大小尺寸，也就是一个样本的尺寸
DataType = 'double';  % 设置存储的数据精度，这里使用了浮点型
Deflate = 0;  % 设置数据压缩的等级，使用gzip压缩方式，这里默认不进行压缩
% 创建数据库的同时创建分组,分组的名称为, '1', '2'...'8', '9'
CreateDataSet( h5ID, GroupNum, GroupSize, ChunkSize, DataType, Deflate );

