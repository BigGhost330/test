r = 1;
g = 1;
b = 1;
i = 1;
j = 1;
ro = []; %分别存放各帧RGB的数值
go = [];
bo = [];
r1 = []; %分别存放各帧RGB的数值
g1 = [];
b1 = [];
nonframe = [];
obj = VideoReader('F:\科研\聪神\液体混合v2\yetihunhe30s.mp4');
numFrames = obj.NumFrames;
figure = read(obj, 1);
p = size(figure);
x = p(1,1);
y = p(1,2);

for a = 1 : numFrames
    frame = read(obj, a);
    for x1 = 450 : 510
       for y1 = 1500 : 1560
            ro(i,j) = frame(x1,y1,1) ;
            go(i,j) = frame(x1,y1,2) ;
            bo(i,j) = frame(x1,y1,3) ;
            j = j + 1;
       end
       j = 1;
       i = i + 1;
    end
    i = 1;
    j = 1;
    R = mean(ro(:)); %计算RGB三个矩阵的均值
    G = mean(go(:));
    B = mean(bo(:));
    nonframe(a) = a/25;
    r1(a)=R;%将每个图像的RGB矩阵均值存入r、g、b数组中
    g1(a)=G;
    b1(a)=B;
end

data = [nonframe', r1', g1', b1'];

plot(1:numFrames,r1,'r', 1:numFrames,g1,'g', 1:numFrames,b1,'b');
axis([0 750 0 255]); 
xlabel('帧');
ylabel('rgb值');
title('RGB曲线');
legend('R', 'G', 'B'); 