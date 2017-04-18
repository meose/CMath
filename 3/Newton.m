function Newton

%   ????????:
%       1. ?????????? F(x0) ? Fx(x0)
%           - Fx(x0) - ??????? ?????
%       2. ??????? ???? 
%           F(x0) + Fx(x0)*d(x) = 0
%           => d(x) = -F(x0)*Fx(x0)^-1
%       3. ?????????? ??????????? ????????
%           => x = x0 + dx
%       4. ???????? ??????? |x-x0| < abs - ???????? ??????? ?????
%           => |x-x0| ???? ????? norm(x)
%       5. ?????????? ?????????:
%           ??. ????? 4 => ??????? ???????
%           ?????: ?????????? ???????? < 1000 => ??????????? ? ?????? 1
%           ?????: ??????? ?? ???????

% {block initial conditions}
    x0 = [-1; 1]; % ????????? ???????????
    abs = 1e-5; % ????????
    c = 0.1;
    dx = x0; 
    iterations = 0; % ????? ?????????
% {endblock initial conditions}

% {block solve}
    % // ????????? ??????? |x-x0| < ? ? ?????? ??????????? ?? ?????????;
    while (norm(dx) > abs && (iterations < 1000))
    % while ((norm(dx) > abs) && (k < 500))
        [F,Fx] = Function(x0);
        dx=-(Fx\F);
        iterations = iterations + 1;
        x0 = x0 + dx;
    end
% {endblock solve}

% {block output}
    display(x0);
    display(iterations);
    if norm(dx) < abs
        disp('Solution had been found');
    else
        disp('Solution had not been found');
    end
% {endblock output}

function [Inition,Jacoby] = Function(x)
% x^2*y^2 - 3x^3 - 6y^3 + 8 = 0
% x^4 - 9y + 2 = 0

% (2xy^2 - 9x^2, 2x^2y - 18y^2)
% (4*x^3,        -9)

Inition=[
    (x(1)^2)*(x(2)^2) - 3*(x(1)^3) - 6*(x(2)^3) + 8; 
    (x(1)^4) - 9*x(2) + 2
    ];

Jacoby=[
    2*x(1)*(x(2)^2) - 9*(x(1))^2, 2*(x(1)^2)*x(2)-18*x(2)^2;
    4*(x(1)^3), -9
    ];