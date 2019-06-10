function [C_out] = scalartransport(C,C_fu,C_fv,u_star,dt,ws,u,STRATIFICATION,dTdz,dudz)
makegrid;    
kappa = 0.41;
dcdz = zeros(Ni,Nj+1);
dcdz(:,2:end-1) = (C(:,2:end)-C(:,1:end-1))/dz;
k_t = zeros(1,Nj);
k_t = kappa*u_star*z.*(1-z/H);

if (STRATIFICATION)
    alpha_s = 10/3;
    gamma_s = -3/2;
    g = 9.81;
    alpha = 2.8e-3;
    
    Ri = (g*alpha*dTdz)./(dudz).^2;
 
    k_t = k_t.*(1+alpha_s*Ri).^(gamma_s);
else
    k_t = k_t;
end

C_t = zeros(Ni,Nj);
C_t(:,2:end-1) = C(:,1:end-2)-2*C(:,2:end-1)+C(:,3:end);
C_t(:,1) = 0;
C_t(:,end) = 0;

C_out = C + dt*(-u.*(C_fu(2:end,:)-C_fu(1:end-1,:))/dx +ws*(C_fv(:,2:end)-C_fv(:,1:end-1))...
                +k_t.*C_t/dz^2);
end