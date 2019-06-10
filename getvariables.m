makegrid;


g = 9.81;           %m/s^2

% Stratification
STRATIFICATION = false;
T0 = 20;
T10 = 22;
z_t = 1.5;
delta_h = 0.2;
T = T0+(T10-T0)/2*(1+tanh((z-z_t)/delta_h));
dTdz = (T10-T0)/2/delta_h*(sech((z-z_t)/delta_h)).^2;

% Continious or pulse;
CONTINUOUS = true;

% varied Rouse number nor not
% If VARIED = true, the calculation will be performed on each Ro
% in Ro_spectrum

VARIED = false;
Ro_spectrum = 25:5:90;
z_measure = 18;

% Velocity Field
U0 = 0.1;

% Run length
Tmax = 5; %min
dt = 0.5; %s
nsteps = Tmax*60/dt;
% von karman constant
kappa = 0.41;
t = (dt:dt:Tmax*60)/60;

% kinematic viscosity
nu = 1.5e-5;

%Bubble property
R = 5e-3;           % m 
h = 3e-6;           % m 
sigma = 72.9e-3;    % N/m
rho_w = 1000;       % kg/m^3
rho_a = 1.225;      % kg/m^3
l_c = sqrt(sigma/rho_w/g);
N = (R/l_c)^2*(R/h)^(7/8);
ds = R^(3/8)*h^(5/8);
G = rho_w/rho_a;

% Aerosol property
d_star = ds*((G-1)*g/nu^2)^(1/3);
Re_p = 1/18*d_star^3;
ws = (G-1)*g*(ds^2)/18/nu;

% Location of the source cell
Source_x = Ni*0.01;
Source_y = 1;

% Plot the result
PLOT = false;
ntout = 10;









