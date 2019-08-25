function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

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

% Calculate the value of hypothesis. Call the sigmoid function with X *
% theta.
sigm = sigmoid(X * theta);

% Calculate the cost using the standard formula.
J = sum((-1 * y .* log(sigm)) + (-1 * (1 - y) .* log(1 - sigm))) / m;

% Ignore the first parameter to be penalized
J = J + (lambda * sum(theta(2:size(theta)) .^ 2) / (2 * m));

% The gradient's must be calculated in one shot. So, we need to compute the
% value of (hypothesis - y) which will change for each value of theta.
const = (sigm - y);

% Now calculate the gradients:
% Ignore the first parameter to be penalized.
grad(1) = sum(const .* X(:, 1)) / m;

for iter = 2:length(theta)
    grad(iter) = (sum(const .* X(:, iter)) + (lambda * theta(iter))) / m;
end


% =============================================================

end
