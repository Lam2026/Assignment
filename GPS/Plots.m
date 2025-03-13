%% Task 2 Multi-correaltor Plot
correlation=trackResults(4).I_multi{201};
if correlation(6)<0
    correlation=-correlation;
end
plot(-0.5:0.1:0.5,correlation,'r-');hold on;
scatter(-0.5:0.1:0.5,correlation,'bo');
xlabel('Code Delay');
ylabel('Correlator Output');
title('Correlation Plot (with Multiple Correlator)');

%% Task 1 Acquisition Plot

plotAcquisition_3D(acqResults);

%% Task 4 Velocity

vel=[];
for i = 1:size(navSolutions.vX,2)
   vel = [vel; navSolutions.vX(i), navSolutions.vY(i), navSolutions.vZ(i)] ;
end
figure;
plot(1:39,vel(:,1),1:39,vel(:,2));
legend('Velocity (x-direction)','Velocity (y-direction)')


%% Task 5 Velocity
vel_kf=[];
for j = 1:size(navSolutions.vX,2)
   vel_kf=[vel_kf; navSolutions.VX_kf(j), navSolutions.VY_kf(j), navSolutions.VZ_kf(j)] ;
end
figure;
plot(1:39,vel_kf(:,1),1:39,vel_kf(:,2));
legend('Velocity (x-direction)','Velocity (y-direction)')