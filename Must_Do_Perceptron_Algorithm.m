clc;
clear;

%导入数据
X=[1,0;1,1;0,2;2,1;2,2;1,3];
y=[1;1;1;-1;-1;-1];
[N,M]=size(X);
%扩充矩阵
Xe=[X,ones(N,1)];
for i=1:N
    Xe(i,:)=Xe(i,:)*y(i);
end

for j=1:3
    %随机取初始化权向量
    W=randperm(20,3);
    %开始迭代
    W=Perceptron(Xe,W);
    %画图
    scatter(X(1:3,1),X(1:3,2),80,'rs')
    hold on
    scatter(X(4:6,1),X(4:6,2),80,'g*')
    hold on
    x=0:3;
    line=(-W(3)-W(1)*x)/W(2);
    plot(x,line)
    hold on
    grid on
end
title('感知器算法')
xlabel('x1');ylabel('x2');
legend('Class 1','Class 2',['不同初始权值的',sprintf('\n'),'感知器分类线'])

function W = Perceptron(Xe,W)
N=size(Xe,1);
count=0;
while count<N
for i=1:N
    G=W*Xe(i,:)';
    if G>0
    count=count+1;
    else
    count=0;
    W=W+Xe(i,:);
    end
    if count==N
        break;
    end
end
end
end

