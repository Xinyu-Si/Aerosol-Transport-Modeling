function plotswe(C,C_add)
    a = nonzeros(C_add);
    figure(1);
    [x,z] = size(C);
    pcolor((1:x)*0.1,(1:z)*0.1,log(C'/a));
    colorbar;
    ttl = title('log($C/\tilde{C}$)');
    xlb = xlabel('x(m)');
    ylb = ylabel('z(m)');
    set([xlb,ylb,ttl],'interpreter','latex','fontsize',14);
    shading flat
    axis image
    drawnow;
end