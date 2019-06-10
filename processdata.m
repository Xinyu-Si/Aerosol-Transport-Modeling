% Plot the measurement points
close all;
figure;
pl = plot(xm*0.1,ym*0.1,'ro');
set(pl,'markersize',10,'markerfacecolor','r');
axis([0,10,0,3]);
PointStr = {'1a (2.5,1.0)','1b (2.5,1.8)','2a (5.0,1.0)','2b (5.0,1.8)','3a (7.5,1.0)','3b (7.5,1.8)'};
text(xm*0.1-0.8,ym*0.1+0.15,PointStr,'interpreter','latex','fontsize',14);
text(0.05,0.08,'$\uparrow$ Source','interpreter','latex','fontsize',14);
text(9.5,2.8,'(a)','interpreter','latex','fontsize',14);
xlb = xlabel('x(m)');
ylb = ylabel('z(m)');
set([xlb,ylb],'interpreter','latex','fontsize',14);

%%
% plot the outcome concentration at 6 measure points
close all
figure;
hold on
C_tilde = nonzeros(C_add);
plot(t,Cm(1,:)/C_tilde,'-','color',[0 0.4470 0.7410]);
plot(t,Cm(2,:)/C_tilde,'--','color',[0 0.4470 0.7410]);
plot(t,Cm(3,:)/C_tilde,'-','color',[0.8500 0.3250 0.0980]);
plot(t,Cm(4,:)/C_tilde,'--','color',[0.8500 0.3250 0.0980]);
plot(t,Cm(5,:)/C_tilde,'-','color',[0.4660 0.6740 0.1880]);
plot(t,Cm(6,:)/C_tilde,'--','color',[0.4660 0.6740 0.1880]);
hold off
box on
% axis([0,3,1e-14,1e-4]);
set(gca,'yscale','log');
xlb = xlabel('t(min)');
ylb = ylabel('C/$\tilde{C}$');
% lgd = legend('1a','1b','2a','2b','3a','3b','location','southeast');
set([xlb,ylb],'interpreter','latex','fontsize',14);
text(2.8,3e-5,'(d)','interpreter','latex','fontsize',14);

ax = gca;
ax.XGrid = 'on';
%%