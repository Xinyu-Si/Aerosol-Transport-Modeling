function Clock(n,t_start,nsteps,dt,VARIED)
  elapsed_time=toc(t_start);
  time_per_step=elapsed_time/n;
  time_remaining=(nsteps-n)*time_per_step;

  fprintf('\n');
  fprintf('Time step: %d of %d, Simulation time: %.2f min\n',n,nsteps,n*dt/60);
  fprintf('Wallclock time per time step: %.2f s, Speedup: %.2f X real time\n', ...
	  time_per_step,dt/time_per_step);
  fprintf('Time remaining: %.0f s (%.1f min)\n',time_remaining,time_remaining/60);

end