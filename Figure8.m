%% Matlab File to recreate Figure 8 - Projection Model

close all
clear all
load('PointingData.mat')

%% Study 1
noBox = 4;
noLayout = 9;
noParticipants = 20;
noZones = 3;

dir_est_study1 = zeros(size(x_pos_study1_vr));
dir_true_study1 = dir_est_study1;
dir_proj_study1 = dir_est_study1;

for n = 1:noParticipants
    for l = 1:noLayout
        for b = 1:noBox
            for z = 1:noZones
                % Pointing direction to where the participant thinks the
                % box is
                origin = [nanmedian(x_pos_study1_vr(n,l,b,z,:),5);nanmedian(z_pos_study1_vr(n,l,b,z,:),5)];
                north = origin;
                north(2) = north(2)+100;
                dir = [nanmedian(x_dir_study1_vr(n,l,b,z,:),5);nanmedian(z_dir_study1_vr(n,l,b,z,:),5)];
                [~,~,dir_est_study1(n,l,b,z,:)] = findAngle(origin, north, dir);
                % Pointing direction to the true box location
                dir = [P_study1_vr(l,1,b);P_study1_vr(l,3,b)];
                [~,~,dir_true_study1(n,l,b,z,:)] = findAngle(origin, north, dir);
                
                % Projection Model: Predicted direction
                dir = [P_study1_vr_proj(l,1,b);P_study1_vr_proj(l,3,b)];
                [~,~,dir_proj_study1(n,l,b,z,:)] = findAngle(origin, north, dir);
            end
        end
    end
end

%% Study 2
noBox = 4;
noLayout = 6;
noParticipants = 7;
noZones = 2;
noFaceDirection = 3;

dir_est_study2 = zeros(size(x_pos_study2));
dir_true_study2 = dir_est_study2;
dir_proj_study2 = dir_est_study2;

for n = 1:noParticipants
    for l = 1:noLayout
        for b = 1:noBox
            for z = 1:noZones
                for f = 1:noFaceDirection
                    % Pointing direction to where the participant thinks the
                    % box is
                    origin = [nanmedian(x_pos_study2(n,l,b,z,f,:),6);nanmedian(z_pos_study2(n,l,b,z,f,:),6)];
                    north = origin;
                    north(2) = north(2)+100;
                    dir = [nanmedian(x_dir_study2(n,l,b,z,f,:),6);nanmedian(z_dir_study2(n,l,b,z,f,:),6)];
                    [~,~,dir_est_study2(n,l,b,z,f,:)] = findAngle(origin, north, dir);
                    % Pointing direction to the true box location
                    dir = [P_study2(l,1,b);P_study2(l,3,b)];
                    [~,~,dir_true_study2(n,l,b,z,f,:)] = findAngle(origin, north, dir);
                    
                    % Projection Model: Predicted direction
                    dir = [P_study2_proj(l,1,b);P_study2_proj(l,3,b)];
                    [~,~,dir_proj_study2(n,l,b,z,f,:)] = findAngle(origin, north, dir);
                end
            end
        end
    end
end

%% Study 3
noBox = 4;
noLayout = 4;
noParticipants = 6;
noZones = 6;

dir_est_study3 = zeros(size(x_pos_study3));
dir_true_study3 = dir_est_study3;
dir_proj_study3 = dir_est_study3;

for n = 1:noParticipants
    for l = 1:noLayout
        for b = 1:noBox
            for z = 1:noZones
                % Pointing direction to where the participant thinks the
                % box is
                origin = [nanmedian(x_pos_study3(n,l,b,z,:),5);nanmedian(z_pos_study3(n,l,b,z,:),5)];
                north = origin;
                north(2) = north(2)+100;
                dir = [nanmedian(x_dir_study3(n,l,b,z,:),5);nanmedian(z_dir_study3(n,l,b,z,:),5)];
                [~,~,dir_est_study3(n,l,b,z,:)] = findAngle(origin, north, dir);
                % Pointing direction to the true box location
                dir = [P_study3(l,1,b,z);P_study3(l,3,b,z)];
                [~,~,dir_true_study3(n,l,b,z,:)] = findAngle(origin, north, dir);
                
                % Projection Model: Predicted direction
                dir = [P_study3_proj(l,1,b,z);P_study3_proj(l,3,b,z)];
                [~,~,dir_proj_study3(n,l,b,z,:)] = findAngle(origin, north, dir);
            end
        end
    end
end

%% Study 4
noBox = 4;
noLayout = 4;
noParticipants = 10;
noConditions = 8;
noRuns = 2;

dir_est_study4 = zeros(size(x_pos_study4));
dir_true_study4 = dir_est_study4;
dir_proj_study4 = dir_est_study4;

for n = 1:noParticipants
    for l = 1:noLayout
        for b = 1:noBox
            for z = 1:noConditions
                for f = 1:noRuns
                    % Pointing direction to where the participant thinks the
                    % box is
                    origin = [nanmedian(x_pos_study4(n,l,b,z,:,f),5);nanmedian(z_pos_study4(n,l,b,z,:,f),5)];
                    north = origin;
                    north(2) = north(2)+100;
                    dir = [nanmedian(x_dir_study4(n,l,b,z,:,f),5);nanmedian(z_dir_study4(n,l,b,z,:,f),5)];
                    [~,~,dir_est_study4(n,l,b,z,:,f)] = findAngle(origin, north, dir);
                    % Pointing direction to the true box location
                    dir = [P_study4(z,l,1,b);P_study4(z,l,3,b)];
                    [~,~,dir_true_study4(n,l,b,z,:,f)] = findAngle(origin, north, dir);
                    
                    % Projection Model: Predicted direction
                    dir = [P_study4_proj(z,l,1,b);P_study4_proj(z,l,3,b)];
                    [~,~,dir_proj_study4(n,l,b,z,:,f)] = findAngle(origin, north, dir);
                end
            end
        end
    end
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots
for j = 1:4
    clear x y
    if exist('legl','var')
        clear legl
    end
    hFig = figure;
    set(hFig, 'Position', [20 20 800 2000], 'Color',[1 1 1])
    hold on
    grid on
    plot(lims, lims, 'k-')
    var1 = strcat('nanmean(dir_proj_study', char(label(j)), ',1)');
    var2 = strcat('nanmean(dir_est_study', char(label(j)), ',1)');
    var3 = strcat('nanmean(dir_true_study', char(label(j)), ',1)');
    ytemp = eval(var3)-eval(var1);
    xtemp = eval(var3)-eval(var2);
    x = xtemp(:);
    y = ytemp(:);

    [pfit, sfit] = polyfit(x(:), y(:),1);
    xtemp1 = lims(1):0.3:lims(2);
    ytemp1 = xtemp1*pfit(1)+pfit(2);
    [Rcorr, p_IDirect, rup, rol] = corrcoef(x(:), y(:))

    % 95% CI
    [yfit,dy] = polyconf(pfit,xtemp1,sfit,'predopt','curve');
    lightred = [1 134/255 134/255];

    temp = yfit+dy;
    fill([xtemp1  xtemp1(end:-1:1)], [yfit-dy temp(end:-1:1)], lightred)

    ytemp = eval(var3)-eval(var1);
    xtemp = eval(var3)-eval(var2);
    a = xtemp(:);
    b = ytemp(:);

    for i = 1:4
        for m = 1:noZonesAll(j)
            blu = xtemp(:,:,i,m,:);
            bla = ytemp(:,:,i,m,:);
            if j == 2 && m == 2
                plot(blu(:), bla(:), markers(m+1), 'color', 'black', 'markerfacecolor', colour(i,:), 'markersize', 25, 'linewidth', 1)
                legl(m) = plot(-1000, -1000, markers(m+1), 'color', 'black', 'markersize', 25, 'linewidth', 1);
            else
                plot(blu(:), bla(:), markers(m), 'color', 'black', 'markerfacecolor', colour(i,:), 'markersize', 25, 'linewidth', 1)
                legl(m) = plot(-1000, -1000, markers(m), 'color', 'black', 'markersize', 25, 'linewidth', 1);
            end
        end
    end
    switch j
        case 1
            hlegend = legend(legl, 'Zone A', 'Zone B', 'Zone C');
            set(hlegend, 'fontsize', 32);
        case 2
            hlegend = legend(legl, 'Zone A', 'Zone C');
            set(hlegend, 'fontsize', 32);
        case 3
            hlegend = legend(legl, 'Zone A', 'Zone B', 'Zone C', 'Zone D', 'Zone E', 'Zone F');
            set(hlegend, 'fontsize', 32);
        case 4
            hlegend = legend(legl, 'Conf 1', 'Conf 2', 'Conf 3', 'Conf 4', 'Conf 5', 'Conf 6', 'Conf 7', 'Conf 8');
            set(hlegend, 'fontsize', 32);
    end
    plot(xtemp1,yfit, 'r--', 'linewidth', 5);
    set(hlegend, 'location', 'Northwest')
    ylabel('Predicted error [deg]', 'Fontsize', fonts)
    xlabel('Pointing error [deg]', 'Fontsize', fonts)
    axis square
    axis([lims lims])
    set(gca, 'xtick', lims(1):45:lims(2), 'ytick', lims(1)+45:45:lims(2),'Fontsize', fonts)
end