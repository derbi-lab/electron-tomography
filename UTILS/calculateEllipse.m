%function [X Y] = calculateEllipse(x, y, a, b, angle, steps)
function [X Y] = calculateEllipse(a, b,angle)
%# This functions returns points to draw an ellipse
    %#
    %#  @param x     X coordinate
    %#  @param y     Y coordinate
    %#  @param a     Semimajor axis
    %#  @param b     Semiminor axis
    %#  @param angle Angle of the ellipse (in degrees)
    %#
    % center
    x=0;
    y=0;
    % angle of the ellipse
    %angle = 0;
    % the step size
    %steps = 10;
    %just changed
    %d=6;
    d=4;
    S=pi*(3/2*(a+b)+sqrt(a*b))/4;
    %S=pi*(3*(a+b)-sqrt((3*a+b)*(a+3*b)));
    steps = round(S/d);
    beta = -angle * (pi / 180);
    sinbeta = sin(beta);
    cosbeta = cos(beta);

    %alpha = linspace(0, 360, steps)' .* (pi / 180);
    alpha = linspace(d, 360, steps)' .* (pi / 180);
    sinalpha = sin(alpha);
    cosalpha = cos(alpha);

    X = x + (a * cosalpha * cosbeta - b * sinalpha * sinbeta);
    Y = y + (a * cosalpha * sinbeta + b * sinalpha * cosbeta);

    if nargout==1, X = [X Y]; end
end
