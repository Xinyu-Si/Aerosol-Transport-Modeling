getvariables;
makegrid;

% initial concentration
C = zeros(Ni,Nj);
C(Source_x,Source_y) = 50*N/dx/dz/B;
C_add = C;
% initial velocity
    LogLawFcn = @(x)(U0-x/kappa*(log(9*x*H/nu)+(nu/9/x/H)-1));
    u_star = fzero(LogLawFcn,U0/10);
    % smooth wall friction height
    z0 = nu/9/u_star;
u = u_star/kappa*log(z/z0);
dudz = u_star/kappa./z;

