function [x, y] = getPoint(intervalX, intervalY, points, eps)
gamma1 = rand;
gamma2 = rand;
deltaX = (intervalX(2)-intervalX(1))/(points-1);
deltaY = (intervalY(2)-intervalY(1))/(points-1);
X = linspace(intervalX(1), intervalX(2), points);
Y = linspace(intervalY(1), intervalY(2), points);
cntX = numel(X);
cntY = numel(Y);
a = zeros(cntX*cntY, 2);
for i = 1:numel(X)
    for j = 1:numel(Y)
        a((i-1)*cntY + j, :) = [X(i), Y(j)];
    end
end
file=fopen('input.txt','w');
formatSpec = '%4.2f %4.2f\n';
fprintf(file, formatSpec, a);
fclose(file); 
command=('C:\Users\User\Desktop\matlab\poltergeist\plst_1.exe');
system(command);
data = load("plst_dstr.txt");

%getting x
summ = sum(data(1:cntY))*deltaX*deltaY;
x = X(1);
save_i = 1;
for i = 2:cntX
    if (abs(summ-gamma1) <= eps)
        break;
    else
        summ = summ + sum(data((i-1)*cntY+1:i*cntY))*deltaX*deltaY;
        x = X(i);
        save_i = i;
    end
end

disp("got here");
%getting y
% YPU NEED TO REGROUP FILE!!!
intergal_p = sum(data((save_i-1)*cntY+1:save_i*cntY))*deltaX*deltaY;
summ = integral_p*sum(data(1:cntY))*deltaX*deltaY;

end
