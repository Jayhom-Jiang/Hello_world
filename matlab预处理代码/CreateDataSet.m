function CreateDataSet( h5ID, GroupNum, GroupSize, ChunkSize, DataType, Deflate )
%CreateDataSet �˺�������һ��ָ��������Ŀ��������С��h5���ݼ���
%   h5ID������λ�ã��������ݿ��ļ�����
%   GroupNum�������ķ�������Ŀ
%   GroupSize��ÿһ������Ŀռ�ߴ�
%   ChunkSize�����ݿ�Ŀռ䣬�����Ƕ�̬���ݼ�����Ҫָ�����ݿ�ռ�
%   DataType�����ݵĴ洢����
%   Deflate�����ݵ�ѹ���ȼ�
%% ��ʽ��ʼ
%Ҫ������������
classlist=[201608003,201608007,201608009,201608018,201608033,201608034,201608035,201608037];
%Ҫ�����Ƶ��
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

