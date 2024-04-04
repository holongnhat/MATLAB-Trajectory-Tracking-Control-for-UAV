clc
clf
len = length(tout); % tout: 0 -> 150
for i = 1:len
    figure(1);
    grid on;
    if i < 1499
         plot3([xd(i),xd(i+1)],[yd(i),yd(i+1)],[zd(i),zd(i+1)],'--', 'LineWidth', 0.5, 'Color','r')
         xlabel('X');
         ylabel('Y');
         zlabel('Z');
         hold on;
    end
    
    [point1_trans,point2_trans,point3_trans,point4_trans]=drone(phi(i),theta(i),psai(i)); 
    
    % Ve quy dao cho UAV
    % ========================================================
    try
        delete(h1);delete(h2);delete(point);
        plot3([x(i-1),x(i)],[y(i-1),y(i)],[z(i-1),z(i)],'-', 'LineWidth', 2, 'Color','b') 
        hold on;
    catch
    end
    % ========================================================
    
    h1 = plot3([x(i)+point1_trans(1),x(i)+point2_trans(1)],[y(i)+point1_trans(2),y(i)+point2_trans(2)],...
        [z(i)+point1_trans(3),z(i)+point2_trans(3)],"LineWidth",3,"Color","g"); 
        hold on;
    
    h2 = plot3([x(i)+point3_trans(1),x(i)+point4_trans(1)],[y(i)+point3_trans(2),y(i)+point4_trans(2)],...
        [z(i)+point3_trans(3),z(i)+point4_trans(3)],"LineWidth",3,"Color","g");
    
   % set(gca,'ztick',0:20:z(i)+5)
end

%Plot x,y,z out - ref
% ========================================================
figure(2);clf;
subplot(3,1,1)
h1 = plot(tout,xd,"r--","LineWidth",2);hold on;
h2 = plot(tout,x,"b-","LineWidth",2);
legend([h1,h2],["x-ref","x-out"])
grid on;

subplot(3,1,2)
h3 = plot(tout,yd,"r--","LineWidth",2);hold on;
h4 = plot(tout,y,"b-","LineWidth",2);
legend([h3,h4],["y-ref","y-out"])
grid on;

subplot(3,1,3)
h5 = plot(tout,zd,"r--","LineWidth",2);hold on;
h6 = plot(tout,z,"b-","LineWidth",2);
legend([h5,h6],["z-ref","z-out"])
grid on;
% ========================================================

% plot phi, psai, theta 
% ========================================================
figure(3);clf;
subplot(3,1,1)
h7 = plot(tout,phi,"LineWidth",2); hold on;
legend(h7,"phi"),grid on;

subplot(3,1,2)
h8 = plot(tout,psai,"LineWidth",2);
legend(h8,"psai"),grid on;

subplot(3,1,3)
h9 = plot(tout,theta,"LineWidth",2);hold on;
legend(h9,"theta"),grid on;
% ========================================================
