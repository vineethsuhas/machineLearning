function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

% Get the indices with y = 1 and y = 0
y1_indices = find(y==1);
y0_indices = find(y==0);

% Now plot all the y1_indices and y0_indices with X1 and X2 as axes
plot(X(y1_indices, 1), X(y1_indices, 2), 'k+','LineWidth', 2, 'MarkerSize', 7);

plot(X(y0_indices, 1), X(y0_indices, 2), 'ko', 'MarkerFaceColor', 'y','MarkerSize', 7);


% =========================================================================



hold off;

end
