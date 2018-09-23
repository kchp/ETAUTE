function [h, e, h_stored] = lmssim(h_order, my, signal_input)

% *************************************************************
% Adaptiv filtrering på et kendt system med LMS algoritmen
%
% Systemet (plant) er en 8. ordens AR model
% givet ved 9 a-koefficienter
%
% function [h_converged, e] = lmssim(h_order, my, signal_input)
%
% Input til funktionen er filterorden, stepsize og signal
%
% LGJ 09/2017
% *************************************************************


load plant
g = d;

% ***** Initialiseringer
plant_order = length(g);
plant_delay = 0;
h = zeros(h_order,1);
h_stored = h;
x = signal_input;
N = length(signal_input);


if h_order > plant_delay+plant_order
    StartTime = h_order;
else
    StartTime = plant_delay+plant_order;
end


% ***** LMS algoritme over alle inputsignal-samples
for n=StartTime:N
    d = x(n-plant_delay-plant_order+1:n-plant_delay)*g';
    y = x(n-h_order+1:n)*h;
    e(n) = d-y;
       %NormFactor = 1;                                   % ordinary LMS
       NormFactor = x(n-h_order+1:n)*x(n-h_order+1:n)';  % when NLMS version
    h = h + my*x(n-h_order+1:n)'*e(n)/NormFactor;
    h_stored = [h_stored flipud(h)];
end



