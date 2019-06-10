
clear all;

AerosolTransport;
%%
%{
%%
close all;
figure;
for i = 1:length(ws_spectrum)
    MaxLocation(i) = find(C_profile(:,i)==max(C_profile(:,i)));
    Cmax(i) = C_profile(MaxLocation(i),i);
end
C_tilde = nonzeros(C_add);
XMax = x(MaxLocation);
pl = plot(XMax,Cmax/C_tilde,'r--',...
          x,C_profile/C_tilde,'k-');
set(gca,'yscale','log');
set(pl,'linewidth',1);
axis([1,10,1e-9,1e-4]);
xlb = xlabel('$x(m)$');
ylb = ylabel('$C$/$\tilde{C}$');
lgd = legend('$C = C_{max}$','C profile with varied Ro','location','northwest');
set([lgd,xlb,ylb],'interpreter','latex','fontsize',14);
% lgd = legend(
String = sprintfc('%d',Ro_spectrum);
text(x(70)*ones(14,1),C_profile(70,:)/C_tilde*1.3,String,'interpreter','latex');
text(x(70)-0.75,C_profile(70,1)/C_tilde*1.3,'Ro =','interpreter','latex');
text(9.5,7e-5,'(a)','interpreter','latex');
box on
%%
% figure;
plot(z,u,'k-');
xlb = xlabel('z(m)');
ylb = ylabel('$u (m/s)$');
set([xlb,ylb],'interpreter','latex','fontsize',12);
yyaxis right
plot(z,k_t);
ylb = ylabel('$k_{t}$ ($m^{2}$/s)');
set([xlb,ylb],'interpreter','latex','fontsize',12);
camroll(-90)
%%
close all;
k_t = kappa*u_star*z.*(1-z/H);
line(T,z,'color','r');
xlim([19.5,22.5]);
xlb = xlabel('$T (^{o}C)$');
ylb = ylabel('$z(m)$');
set([xlb,ylb],'interpreter','latex','fontsize',14);
text(22.25,2.8,'(c)','interpreter','latex','fontsize',14);
ax1 = gca;
ax1.XColor = 'r';
ax1.YColor = 'r';
ax1_pos = ax1.Position;
ax2 = axes('Position',ax1_pos,'XAxisLocation','top','YAxisLocation','right','Color','none');
line(dTdz,z,'Parent',ax2,'color','k');
% ax2.XColor = 'r';
% ax2.YColor = 'r';
xlb = xlabel('$dT/dz$ $(K/m)$');
set([xlb],'interpreter','latex','fontsize',14);

%%
w_s = Ro_spectrum*u_star*kappa;
% vpasolve(w_s(max) == (G-1)*g*(dd^2)/18/nu)
dd = sqrt(w_s*18*nu/g/(G-1));
dd_star =  dd*((G-1)*g/nu^2)^(1/3)
%}

