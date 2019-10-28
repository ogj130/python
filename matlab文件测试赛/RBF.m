clc
clear
x1=[228.6153846,0.538461538,1.076923077,1.615384615,2.153846154,2.692307692,3.230769231,3.769230769,4.307692308,4.846153846,5.384615385,5.923076923,6.461538462,7,7.538461538,8.076923077,8.615384615,9.153846154,9.692307692,10.23076923,10.76923077,11.30769231,11.84615385,12.38461538,12.92307692,13.46153846,14,14.53846154,15.07692308];
x2=[133.9230769,0.307692308,0.615384615,0.923076923,1.230769231,1.538461538,1.846153846,2.153846154,2.461538462,2.769230769,3.076923077,3.384615385,3.692307692,4,4.307692308,4.615384615,4.923076923,5.230769231,5.538461538,5.846153846,6.153846154,6.461538462,6.769230769,7.076923077,7.384615385,7.692307692,8,8.307692308,8.615384615];
x3=[100.6923077,0.230769231,0.461538462,0.692307692,0.923076923,1.153846154,1.384615385,1.615384615,1.846153846,2.076923077,2.307692308,2.538461538,2.769230769,3,3.230769231,3.461538462,3.692307692,3.923076923,4.153846154,4.384615385,4.615384615,4.846153846,5.076923077,5.307692308,5.538461538,5.769230769,6,6.230769231,6.461538462];
y=[82.07100592,0.177514793,0.355029586,0.532544378,0.710059172,0.887573965,1.065088758,1.24260355,1.420118343,1.597633136,1.775147929,1.952662722,2.130177515,2.307692308,2.485207101,2.662721894,2.840236686,3.017751479,3.195266272,3.372781065,3.550295858,3.727810651,3.905325444,4.082840237,4.260355029,4.437869822,4.615384615,4.792899408,4.970414202]';
x1_train=x1(1:15)';
x2_train=x2(1:15)';
x3_train=x3(1:15)';
x1_test=x1(15:29)';
x2_test=x2(15:29)';
x3_test=x3(15:29)';
y_train=y(1:15);
y_test=y(15:29);

X_train=[x1_train,x2_train,x3_train];
X_test=[x1_test,x2_test,x3_test];
Y_train=y_train;
Y_test=y_test;
X_train=X_train';
Y_train=Y_train';
X_test=X_test';
Y_test=Y_test';
N = size(X_test,2);
net = newrbe(X_train,Y_train,30);
T_sim=sim(net,X_test);
T_test=Y_test;
error=abs(T_sim-T_test)./T_test;
R2 = (N * sum(T_sim .* T_test) - sum(T_sim) * sum(T_test))^2 / ((N * sum((T_sim).^2) - (sum(T_sim))^2) * (N * sum((T_test).^2) - (sum(T_test))^2));
result=[T_test' T_sim' error'];

figure
plot(1:N,T_test,'b:*',1:N,T_sim,'r-o')
legend('真实值','预测值')
xlabel('预测样本')
ylabel('辛烷值')
string = {'预测结果对比';['R^2=' num2str(R2)]};
title(string)




