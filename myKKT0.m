clear;
clc;
x1 = sdpvar(1,1);
x2 = sdpvar(1,1);
x3 = sdpvar(1,1);
x4 = sdpvar(1,1);
% B = [];
% C = [];
% C = [C,-x1+x2+x3+10*x4-20<=0];
% C = [C,x1-3*x2+x3-30<=0];
% C = [C,x2-3*x4<=0];
% C = [C,x1-40<=0];
% C = [C,-x4+2<=0];
% C = [C,x4-3<=0];
% C = [C,-x1<=0];
% C = [C,-x2<=0];
% C = [C,-x3<=0];
% 
% obj = -(x1+2*x2+3*x3+x4);
% ops=sdpsettings('verbose', 2, 'solver', 'gurobi');
% ops.gurobi.MIPGap = 0.001;
% ops.gurobi.MIPGapAbs = 0.001;
% %进行求解计算         
% result=optimize(C,obj,ops);
% if result.problem==0 
%     fprintf('求解成功 ！！！\n');
% else
%     error('求解出错！请查找错误来源');
% end
% [model,~] = export(C, obj, sdpsettings('solver','gurobi'));
% gurobi_write(model, 'myKKTModel0.lp');
% %%     
% obj =  value(obj)
% x1 =  value(x1)
% x2 =  value(x2)
% x3 =  value(x3)
% x4 =  value(x4)
% 矩阵相乘加约束对整型变量无效？
%   x1 x2 x3 x4 b
A = [-1 1 1 10 -20;
      1 -3 1 0 -30;
      0 1 0 -3 0;
      1 0 0 0 -40;
      0 0 0 -1 2;
      0 0 0 1 -3;
      -1 0 0 0 0;
      0 -1 0 0 0;
      0 0 -1 0 0;];
%   x1 x2 x3 x4 b
X = [x1 x2 x3 x4 1];
B = [-1 -2 -3 -1 0];
obj = B*X';
C1 = [A*X'<=0];
ops=sdpsettings('verbose', 2, 'solver', 'gurobi');
ops.gurobi.MIPGap = 0.001;
ops.gurobi.MIPGapAbs = 0.001;
%进行求解计算         
result=optimize(C1,obj,ops);
if result.problem==0 
    fprintf('求解成功 ！！！\n');
else
    error('求解出错！请查找错误来源');
end
[model,~] = export(C1, obj, sdpsettings('solver','gurobi'));
gurobi_write(model, 'myKKTModel1.lp');
%%     
obj =  value(obj)
x1 =  value(x1)
x2 =  value(x2)
x3 =  value(x3)
x4 =  value(x4)