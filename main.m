clc;
X = linspace(-2, 3, 10);
Y = linspace(-4, 1, 10);
a = zeros(numel(X)*numel(Y), 2);
size(a)
for i = 1:numel(X)
    for j = 1:numel(Y)
        %X(i)
        a((i-1)*numel(Y) + j, :) = [X(i), Y(j)];
    end
end
file=fopen('input.txt','w');
formatSpec = '%4.2f %4.2f \n';
fprintf(file, formatSpec, a);
fclose(file); 

disp("OK");
command=('C:\Users\User\Desktop\matlab\poltergeist\plst_1.exe');
system(command);
data = load("plst_dstr.txt");

plot3(a(:,1), a(:, 2), data);