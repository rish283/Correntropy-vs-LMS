function [theta] = corrgradDescent(X, y, theta, sigma, alpha)

m = length(y); 

for iter = 1:1000
    thetaorg = theta;
    theta([1],:) = thetaorg([1],:) + alpha*sum([[[X*thetaorg] - y].*exp(-[[X*thetaorg] - y].^2/(2*((sigma)^2)))/(m*8.8858*((sigma)^3))].*X(:, 1));
    theta([2],:) = thetaorg([2],:) + alpha*sum([[[X*thetaorg] - y].*exp(-[[X*thetaorg] - y].^2/(2*((sigma)^2)))/(m*8.8858*((sigma)^3))].*X(:, 2));
    theta([3],:) = thetaorg([3],:) + alpha*sum([[[X*thetaorg] - y].*exp(-[[X*thetaorg] - y].^2/(2*((sigma)^2)))/(m*8.8858*((sigma)^3))].*X(:, 3));
    theta([4],:) = thetaorg([4],:) + alpha*sum([[[X*thetaorg] - y].*exp(-[[X*thetaorg] - y].^2/(2*((sigma)^2)))/(m*8.8858*((sigma)^3))].*X(:, 4));
end
end
