function CreateDataSet( h5ID, GroupNum, GroupSize, ChunkSize, DataType, Deflate )
%CreateDataSet 此函数创建一个指定分类数目和样本大小的h5数据集合
%   h5ID：创建位置，包括数据库文件名称
%   GroupNum：创建的分组总数目
%   GroupSize：每一个分组的空间尺寸
%   ChunkSize：数据块的空间，由于是动态数据集，需要指定数据块空间
%   DataType：数据的存储类型
%   Deflate：数据的压缩等级
%% 程式开始
%要处理的类的名字
classlist=[201608003,201608007,201608009,201608018,201608033,201608034,201608035,201608037];
%要处理的频率
frequelist=[225,300,380,450,512];
for i = 1 : 1 : length(classlist)
    for j = 2:1:length(frequelist)
        group_name = ['/',num2str(classlist(i)),'_',num2str(frequelist(j))];
        h5create(h5ID, group_name, GroupSize,...
                   'ChunkSize', ChunkSize,...
                   'Datatype', DataType,...
                   'Deflate', Deflate);
    end
end
end

