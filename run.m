
clear; close all; clc;

load('cleandata_students.mat')

fprintf('Creating six trees on clean data\n\n')
for k = 1:6
    CreateTree( k, x, y, 1 );
end

fprintf('Generating non-normalized confusion matrix and analysis metrics on clean data\n')
[ confusion, recall, precision, f1, cr ] = Confusion( x, y, 0 )

load('noisydata_students.mat')

fprintf('Creating six trees on nosiy data\n\n')
for k = 1:6
    CreateTree( k, x, y, 1 );
end

fprintf('Generating non-normalized confusion matrix and analysis metrics on noisy data\n')
[ confusion, recall, precision, f1, cr ] = Confusion( x, y, 0 )
