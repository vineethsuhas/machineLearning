function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

% Calculate the value of hypothesis. Call the sigmoid function with X *
% theta.
sigm = sigmoid(X*theta);

% Calculate the cost using the standard formula.
J = sum((-1 * y .* log(sigm)) + (-1 * (1 - y) .* log(1 - sigm))) / m;

% The gradient's must be calculated in one shot. So, we need to compute the
% value of (hypothesis - y) which will change for each value of theta.
const = (sigm - y);

% Now calculate the gradients
for iter = 1:length(theta)
    grad(iter) = sum(const .* X(:, iter)) / m;
end

% =============================================================

end
