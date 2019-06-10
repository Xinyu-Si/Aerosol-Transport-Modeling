
makegrid;
getvariables;
initialcondition;

% The location of 6 measurement points
xm = [25,25,50,50,75,75];
ym = [10,18,10,18,10,18];


t_start = tic;
if(VARIED)
    for k = 1:length(Ro_spectrum)     
        initialcondition;
        ws_spectrum = Ro_spectrum*u_star.*kappa;
        ws = ws_spectrum(k);
        for n = 1:nsteps
            C = BoundaryCondition(n,C,C_add);
            [C_fu,C_fv] = C_face(C);
            C = scalartransport(C,C_fu,C_fv,u_star,dt,ws,u,STRATIFICATION,dTdz,dudz);
            if((rem(n,ntout*5)==0||n==1))
                Clock(n,t_start,nsteps,dt);
            end     
        end
        C_profile(:,k) = C(:,z_measure);       
    end
else
    for n=1:nsteps
        C = BoundaryCondition(n,C,C_add);
        [C_fu,C_fv] = C_face(C);
        C = scalartransport(C,C_fu,C_fv,u_star,dt,ws,u,STRATIFICATION,dTdz,dudz);

        if(PLOT&&(rem(n,ntout)==0||n==1))
            plotswe(C,C_add)
        end    

        if((rem(n,ntout*5)==0||n==1))
            Clock(n,t_start,nsteps,dt); 
        end    

        for i = 1:6
            Cm(i,n) = C(xm(i),ym(i));
        end

    end
end