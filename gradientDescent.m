function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

m = length(y);
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    thetaorg = theta;
    theta([1],:) = thetaorg([1],:) - alpha*sum([[[X*thetaorg] - y]/m].*X(:,1));
    theta([2],:) = thetaorg([2],:) - alpha*sum([[[X*thetaorg] - y]/m].*X(:,2));
    theta([3],:) = thetaorg([3],:) - alpha*sum([[[X*thetaorg] - y]/m].*X(:,3));
    theta([4],:) = thetaorg([4],:) - alpha*sum([[[X*thetaorg] - y]/m].*X(:,4));

end

end
