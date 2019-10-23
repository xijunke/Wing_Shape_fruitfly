% function wing_para_output=wing_shape_fruitfly_sixteen_good_2()
% ����ʱ�䡪��2014��6��19��,0:16:04
% �޸�ʱ�䡪��2014��6��14��,23:35:03
% clear all;clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% variable=[R_wingeff,C_avereff,xr,C_maxy];   % ����
% x =[3.004,0.8854,0.3289,0]; 
% x =[3.004,0.8854,0.3289,0.356737];  % R_wing=3.004;  C_aver=0.8854;   % ԭʼ��Ӭ���
% x =[3.004,0.8854,0.3289,0.25];
x =[3.1267,1.1578,0.7896,0.1624]; 
% x=[2.5088,1.1424,0.7124,0.0458];
% x =[2,0.5,0.3289,0.0]; % R_wing=2;  C_aver=0.5;               % ��С��򡪡�����
%  x =[4,2,0.3289,0.0]; % R_wing=4;  C_aver=2;                 % ����򡪡�����
% x =[100,33.7,0.3289,0.0]; % R_wing=100;  C_aver=33.7;   % mm ����@wing 1
%%%%%%%%%%%%%%%%%%%%%%%%%
R_wing=x(1);
C_aver=x(2);
xr0=x(3);               % x-root offset  \mm
C_maxyaxis=x(4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ����ò������������Hedrick����������
%��ϵõ� R_wingeff=3.3328-0.3289=3.004;  Hedrick����������: R_wingeff=3.007; Science������: R_wingeff=2.99; 
R_wingeff=3.004;    %��Ч��򳤶�(mm)  
% Hedrick����������: C_avereff=0.884;     % Science������C_avereff=0.9468mm;  
C_avereff=0.8854;  % ��λ:mm---�����ġ�C_avereff=C_aver0 =0.8854;����ǰ��Եʵ��������ߺ����������־�ֵ����
% ���Կ�����֪չ�ұȣ�������������ŵĳ���ò
% AR=R_wingeff/C_avereff;     %aspect ratio: AR=R^2/A_w;  �������Ϊ: AR=3.40158;  % Science������: AR=3.1519;
% C_avereff=R_wingeff/AR;     %mean chord length: C_aver=A_w/R=R^2/AR/R=R/AR; % C_aver=0.884mm;
% A_w=R_wingeff^2/AR;        %Area of wing: �������Ϊ: A_w=2.66mm^2;   %RJ Wood��Ƶĳ��: A_w=2.84345 mm^2 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (1) ��һ�ַ�ʽ���������������������������ò���ӡ�����Ҫ����Ĳ�������
xr=0.3289;                     % x-root offset  \mm
xr_nd=xr/R_wingeff;      % x-root offset  ������չ��ƫ�þ���
% yr=0;                          % y-root offset  \mm
% yr_nd=yr/C_avereff;   % y-root offset  ����������ƫ�þ���;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��֪r2_nd,���r1_nd, r3_nd, ��r3_nd3
r2_nd=0.5801;      %��֪�����ٶ��������r2_nd;    %��Hedrick����������non_dimensional_2ndMoment: 0.5801(��׼) 
r1_nd=1.106*r2_nd^1.366;  %2013-ICRA-Deng XY   % ���: r1_nd =0.5257
% r3_nd=0.9*r1_nd^0.581; %1984-JEB-Ellingdon;  % ���: r3_nd =0.6194 % ��Hedrick���������� non_dimensional_3rdMoment: 0.6184(��׼)     
% r3_nd3=r3_nd^3;                   % r3_nd3=r3_nd^3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R_wingeff1=3.007;            % Hedrick����������
% R_wingeff1=R_wingeff;            % 
xr_nd1=xr/R_wingeff1;      % x-root offset  ������չ��ƫ�þ���
F_nd1=r2_nd^2+2*xr_nd1*r1_nd+xr_nd1^2;   %����������������F_nd1, �������: F_nd1 =0.4635
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (2) �ڶ��ַ�ʽ�����������������������wing_shape������ǰ��Ե��Ϻ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���-ƫ��-����ϵԭ��ľ���
R_proximal=xr;                                                    % xr=3.19;     %RJ Wood��Ƶĳ��\mm
R_distal=R_wingeff+xr;                                        % yr=0.73;    %RJ Wood��Ƶĳ��\mm
x=linspace(R_proximal,R_distal,200);
x_mod_Root=0.636;                                            % mm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% C_maxylb =0.464385778290230;
% C_maxy25 =0.138924474377504;  % ��Գ���wing_model_88_yaxis��: ��122��; C_maxy =0.1389; 
% C_maxyub =-0.186536829535222; 
% C_maxy=0;
C_maxy=C_maxyaxis;
% C_maxy=C_maxylb;
% C_maxy=C_maxy25;
% C_maxy=C_maxyub;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
% ǰ��Ե6�׶���ʽ��Ϻ���
yr_lead=-0.08249*x.^6+0.9167*x.^5-4.04*x.^4+8.872*x.^3-10.06*x.^2+5.674*x-0.413-x_mod_Root;  
yr_trail=-0.0333*x.^6+0.504*x.^5-2.795*x.^4+7.258*x.^3-8.769*x.^2+3.739*x+0.1282-x_mod_Root;
C_rx=yr_lead-yr_trail;              % ��ȷ�������ٻ�ʵ���ҳ��ֲ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����ǰԵ��Ϻ�����⡪��ʵ��ƽ���ҳ�=���/R_wingeff
wing_aera=trapz(x,C_rx);             %���: wing_aera =2.6597; % mm^2
C_aver0=wing_aera/R_wingeff;   % ������ٻ�ƽ���ҳ�: C_avereff=C_aver0 =0.8854; % mm
%%%%%%%%%%%%%%%%%%%%%%%%%XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

%% ���ö���ʽ������ϻ�á���������ǰ��Ե�ֲ��������ҳ��ֲ�����
% (a) ������ǰԵ�ֲ�����
r_nd=(x-xr)/R_wingeff;
yr_leadnd0=yr_lead/C_avereff;
P_coeff_lead=polyfit(r_nd,yr_leadnd0,6);
% (b)  �����ٺ�Ե�ֲ�����
yr_trailnd0=yr_trail/C_avereff;
P_coeff_trail=polyfit(r_nd,yr_trailnd0,6);
% (c)  �������ҳ��ֲ�����
Cr_nd=yr_leadnd0-yr_trailnd0;
P_coeff_Cr=polyfit(r_nd,Cr_nd,6);  % ����ʽϵ��  % Cr_nd2=polyval(Coeff,r_nd1);
% cftool 
syms r_nd   % �������ҳ��ֲ�Ϊ6�׶���ʽ����ת������������ָ��
yr_leadnd=vpa(poly2sym(P_coeff_lead,r_nd),6); 
yr_trailnd=vpa(poly2sym(P_coeff_trail,r_nd),6);
Cr_nd=vpa(poly2sym(P_coeff_Cr,r_nd),6);  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ע�⡪���öγ����мǲ����޸ģ�ǰ��ֻҪ��֤������ȷ���������ҳ��ֲ����ɡ�
%���µĹ�ʽӦʹ�ú���������ٵ��ҳ��ֲ���ʽC_nd
C_nd=Cr_nd;
R2nd2=double(int(r_nd^2*C_nd,r_nd,0,1)); %��������صĻ�ת�뾶��ƽ��
R1nd1=double(int(r_nd*C_nd,r_nd,0,1));     %һ������صĻ�ת�뾶
S_nd=double(int(C_nd,r_nd,0,1));                %�����ٳ���� % S_nd =1.0000;
disp(['��������صĻ�ת�뾶��ƽ��: r2_2nd=' num2str(R2nd2)  ' ���ٵ�λ��mm^4'])
disp(['��������صĻ�ת�뾶: r_2nd=' num2str(sqrt(R2nd2))  ' ���ٵ�λ��mm^3'])
disp(['һ������صĻ�ת�뾶: r_1nd=' num2str(R1nd1)  ' ���ٵ�λ��mm^3'])
disp(['�����ٳ����Swing_nd=' num2str(S_nd)  ' ���ٵ�λ��mm^2'])
% ����xr_nd=0�����Ա���r_nd��ȡֵ��ΧΪ:r_nd��[0,1], ��ȡ1ʱr_nd=R=11.95 /mm
fx1=(r_nd+xr_nd)^2*C_nd;    % ������������F_nd��ԭʼ��������
% fx2=vpa(fx1,5)
fx3=expand(fx1);
F_ndTrans=double(int(fx3,r_nd,0,1));                    % Result: F_ndTrans =0.46391;
disp(['������������F_ndTrans=' num2str(F_ndTrans)  ' ���ٵ�λ��mm^4'])
F_nd2=R2nd2+2*xr_nd*R1nd1+xr_nd^2;    %ʹ����������Ҳ��ȷ; ���:F_nd2 =0.46391;
disp(['������������F_ndTrans=' num2str(F_nd2)  ' ���ٵ�λ��mm^4'])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���:
% ��������صĻ�ת�뾶��ƽ��: r2_2nd=0.3358 ���ٵ�λ��mm^4
% ��������صĻ�ת�뾶: r_2nd=0.57949 ���ٵ�λ��mm^3  ����������������������Ҫ������
% һ������صĻ�ת�뾶: r_1nd=0.53032 ���ٵ�λ��mm^3
% �����ٳ����Swing_nd=1 ���ٵ�λ��mm^2
% ������������F_nd=0.46391 ���ٵ�λ��mm^4    ����������������������Ҫ������
% ������������F_nd=0.46391 ���ٵ�λ��mm^4    ����������������������Ҫ������
%  �Ա������� (1) ��һ�ַ�ʽ����õ�����������������
% F_nd1=r2_nd^2+2*xr_nd1*r1_nd+xr_nd1^2;   %����������������F_nd1, �������: F_nd1 =0.4635
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��Ӭ������򡪡�fruitgfly_scaled_wing
%%%%%%%%%%%%%%%%%%%%%%%%%
% PHI=74.5*pi/180;
% f3 =0.3378;                        % Hz
% xr=0.3289;                           % x-root offset  \mm                    
xr_nd1=xr0/R_wing;               % x-root offset  ������չ��ƫ�þ���
% xr0=14.5;                            % mm�����ο�Nano 17����
% xr_nd1=xr0/R_wing;           % x-root offset  ������չ��ƫ�þ���; ����xr_nd������ xr_nd=0.03222;@wing 2;
% ע��ǰ����� F_ndTrans�ļ�������˸���
F_ndTrans=R2nd2+2*xr_nd1*R1nd1+xr_nd1^2;    % ����: F_ndTrans=0.5106;@wing 1; or F_ndTrans=0.3710;@wing 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ������Ϻõ�ǰ��Ե
% syms r_nd     % r_nd=(x-xr)/R_wingeff;  % r_nd��(0,1)
% yr_leadnd =-68.4639*r_nd^6+208.297*r_nd^5-245.231*r_nd^4+137.467*r_nd^3-36.8594*r_nd^2+4.79235*r_nd+0.000835197;%@���ǰԵ��������;
% yr_trailnd =-27.6379*r_nd^6+121.093*r_nd^5-185.804*r_nd^4+125.603*r_nd^3-33.1053*r_nd^2-0.145527*r_nd+0.000893019;%@���ǰԵ��������;
f_x_lead=C_aver*yr_leadnd;
f_x_trail =C_aver*yr_trailnd;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_x_lead1=inline(vectorize(f_x_lead),'r_nd');  %��ֵ����
f_x_trail1=inline(vectorize(f_x_trail),'r_nd');   %��ֵ����
r_nd1=linspace(0,1,200);     % x=linspace(R_proximal,R_distal,200);  % x=r_nd*R_wingeff+xr;
f_x_lead2=f_x_lead1(r_nd1); 
f_x_trail2=f_x_trail1(r_nd1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (һ) �ֱ�ƽ���ҳ��ͳ��Ťת������λ�� 
% C_avereff=0.8854;  % mm
% % (1) ���ǰԵ���Ӧ��Ƭ��������ҳ�         % ԭʼ��Ӭ���@C_maxy=0;
C_lead_ymax=max(f_x_lead2);                        % ���: C_lead_ymax=0.3255; k_leadmax=644;% @���ǰԵ�㵽���������ߵľ���;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % (2) ��С��Ե���Ӧ��Ƭ��������ҳ�      % ԭʼ��Ӭ���@C_maxy=0;
C_trail_ymin=min(f_x_trail2);                         % ���: C_trail_ymin = -0.1361;  k_trailmin =409;% @��С��Ե�㵽���������ߵľ���;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C_max_LtoT=C_lead_ymax-C_trail_ymin;      % C_max_LtoT =1.3018;% ԭʼ��Ӭ���@C_maxy=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rx=r_nd1*R_wing+xr0;  % rx=linspace(0,1,200)*R_wingeff+xr; 
r_x_max=max(rx);          % r_x_max=100.3289;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cftool % ���ַ�ʽ���ᳫ
% % (1) ��϶���ʽ����������f_x_lead2(r_x)��϶���yr_leadnd2(r_x)
r_x=linspace(xr0,r_x_max,200);
yr_leadnd2=-2.307e-009*r_x.^6+7.065e-007*r_x.^5-8.38e-005*r_x.^4+0.004742*r_x.^3-0.1288*r_x.^2+1.698 *r_x-0.5166;
% Linear model Poly6: f(x) = p1*x^6 + p2*x^5 + p3*x^4 + p4*x^3 + p5*x^2 +p6*x + p7
% Coefficients (with 95% confidence bounds):
% p1=-2.307e-009(-2.307e-009, -2.307e-009);p2=9.027e-007(9.027e-007, 9.027e-007); p3=-0.0001408(-0.0001408, -0.0001408)
% p4=0.01104(0.01104, 0.01104); p5=-0.4529(-0.4529, -0.4529); p6=9.311(9.311, 9.311); p7=-67.75  (-67.75, -67.75)
% Goodness of fit: SSE: 1.817e-022; R-square: 1;  Adjusted R-square: 1; RMSE: 9.704e-013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
% % (2) ��϶���ʽ����������f_x_trail2(r_x)��϶���yr_trailnd2(r_x)
yr_trailnd2= -9.314e-010*r_x.^6+4.099e-007*r_x.^5-6.329e-005*r_x.^4+0.004316*r_x.^3 -0.1158*r_x.^2+0.02573*r_x+0.034;
% Linear model Poly6: f(x)=p1*x^6+p2*x^5+p3*x^4+p4*x^3+p5*x^2+p6*x + p7
% Coefficients (with 95% confidence bounds):
% p1 =-9.314e-010  (-9.314e-010, -9.314e-010);p2 =4.891e-007  (4.891e-007, 4.891e-007);p3 =-9.514e-005  (-9.514e-005, -9.514e-005);
% p4 =0.008779  (0.008779, 0.008779); p5 =-0.3877  (-0.3877, -0.3877); p6 = 6.714  (6.714, 6.714); p7 = -38.66  (-38.66, -38.66)
% Goodness of fit: SSE: 2.433e-022; R-square: 1;  Adjusted R-square: 1;  RMSE: 1.123e-012;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)   % ������Ϻõ�ǰ��Ե & ���Ŵ�֮���ѹ��λ��
hold on;
%������Ϻõ�ǰ��Ե��ǰ��Ե���������굱�����꣬�������굱�����ꡪ��������Ťת90��
plot(rx,f_x_lead2,'k-',rx,f_x_trail2,'k-','LineWidth',3);  hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��������ϵ
%% ��粿����Shoulder-X�ᡪ��Z��
quiver(-0.25,0,...                                                                % ���
            4.25,0,1,'k-','LineWidth',2);   hold on;                    % �յ�   1����ʾ����X��     
quiver(0,-1.5,...                                                                 % ���
           0,2.5,1,'k-','LineWidth',2);   hold on;                         % �յ�   1����ʾ ����Z��
% ���������root-x�ᡪ��x��    
% quiver(rx(1,1), f_x_lead2(1,1),...                                                   % ���
%            rx(1,length(rx)),0,1,'r-.','LineWidth',2);   hold on;    %�յ� ����x'��
quiver(rx(1,1), f_x_lead2(1,1),...                                                   % ���
           rx(1,length(rx))-0.5,0,1,'r-.','LineWidth',2);   hold on;    %�յ� ����x'��
quiver(rx(1,1), f_x_lead2(1,1)-1,...                                                % ���
           0,2*abs(f_x_lead2(1,1))+1.75,1,'r-.','LineWidth',2);   hold on;% �յ� ����z'��
% pitch-��Ļ���       
% quiver(0, C_maxyaxis*C_max_LtoT,...                                  % ���
%            rx(1,length(rx))+xr0,0,1,'r-.','LineWidth',2);   hold on;    %�յ� ����x'��
quiver(0, C_maxyaxis*C_max_LtoT,...                                  % ���
           rx(1,length(rx))+xr0-0.5,0,1,'r-.','LineWidth',2);   hold on;    %�յ� ����x'��    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
% plot(r_x,yr_leadnd2,'-.r',r_x,yr_trailnd2,'-.r','LineWidth',3); hold on
xlabel('�Ҳ����չ��(y����)')
ylabel('�Ҳ��������(x����)')
title('����ǰ��Ե��Ϻ��������Ҳ�����ò, Ťת���λ�ú�ѹ����ʱ��Ϳռ�ķֲ�')
grid off
axis([-0.3,4.75,-1.25,1.05])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ���Ƴ����������
XC=1.920243385-xr; 
% C_maxy=0.138924474377504;
% YC=-0.149785466+C_maxy;    % YC=-0.288709941;
YC=-0.149785466;    % YC=-0.288709941;
% R_ratio=(R_wing+xr1)/(R_wingeff+xr1);    % R_wingeff=3.004;  % R_wing=100;   % mm  %  XXXX
R_ratio=R_wing/R_wingeff;    % R_wingeff=3.004;    % R_wing=100;   % mm   % R_ratio =33.2889;
C_ratio=C_aver/C_avereff;     % C_avereff=0.8854;    % C_aver=33.7;   % mm   % C_ratio =38.0619;
% delta=xr0-xr;
% XC_tran=R_ratio*XC+xr+delta;      % XC_tran =53.3030
XC_tran=R_ratio*XC+xr0;      % XC_tran =53.3030
YC_tran=C_ratio*YC;              % YC_tran =-5.7011
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yr_leadnd2=inline('-2.307e-009*r_x.^6+7.065e-007*r_x.^5-8.38e-005*r_x.^4+0.004742*r_x.^3-0.1288*r_x.^2+1.698 *r_x-0.5166','r_x');
yr_trailnd2= inline('-9.314e-010*r_x.^6+4.099e-007*r_x.^5-6.329e-005*r_x.^4+0.004316*r_x.^3 -0.1158*r_x.^2+0.02573*r_x+0.034','r_x');
Area=quadl(yr_leadnd2,0.3289,100.3289)-quadl(yr_trailnd2,0.3289,100.3289);
integrand_xc=inline('r_x.*((-2.307e-009*r_x.^6+7.065e-007*r_x.^5-8.38e-005*r_x.^4+0.004742*r_x.^3-0.1288*r_x.^2+1.698 *r_x-0.5166)-(-9.314e-010*r_x.^6+4.099e-007*r_x.^5-6.329e-005*r_x.^4+0.004316*r_x.^3 -0.1158*r_x.^2+0.02573*r_x+0.034))','r_x'); %��ֵ����
integrand_zc=inline('(-2.307e-009*r_x.^6+7.065e-007*r_x.^5-8.38e-005*r_x.^4+0.004742*r_x.^3-0.1288*r_x.^2+1.698 *r_x-0.5166).^2-(-9.314e-010*r_x.^6+4.099e-007*r_x.^5-6.329e-005*r_x.^4+0.004316*r_x.^3 -0.1158*r_x.^2+0.02573*r_x+0.034).^2','r_x'); %��ֵ����
X_C=quadl(integrand_xc,xr0,r_x_max)/Area+xr0;                 % X_C =53.8010;
Z_C=quadl(integrand_zc,xr0,r_x_max)/(2*Area);                   % Z_C =-5.4617;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot(X_C,Z_C,'rd',XC_tran,YC_tran,'dk','LineWidth',4)
plot(XC_tran,YC_tran,'dk','LineWidth',4)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R_wingeff=R_wing;
C_avereff=C_aver;
%% ��һ���֡���ƽ�����������������ز���
% (1) ƽ���������������������Ƴ�ƽ���µķ���
% Rou=0.88*10^(3)*10^(-3);     % mineral oil���������͵��ܶ�
% % % Rou=1.225;                         % ��λ��Kg/m^3  �����������ܶ�
Rou=1.225*10^(-3);           % ��λ��Kg/m^3=10^6/(10^3)^3=10^(-3)mg/mm^3�����������ܶ�
% Coeff_liftdragF_N=6.8201e-012������λ��:mg*mm^-3*mm^4= 10^(-9) kg*m
Coeff_liftdragF_N=(1/2)*Rou*C_avereff*R_wingeff^3*F_ndTrans;  % mg*mm
% (2) ƽ�������������ز��������Ƴ�ƽ���µ�չ����
% mg*mm^-3*mm^5=Kg.m^2:[10^(-12)]=mg.mm^2: [10^12*10^(-12)]= mg.mm^2
M_xaercoeff=(1/2)*Rou*C_avereff^2*R_wingeff^3*F_ndTrans;   % ��ת����������ϵ��  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (3) ƽ�������������ز�������I1y�����Ƴ�ƽ������ϵ�µ�������
fx4=(r_nd+xr_nd)^3*C_nd;                                 % ����C_nd��ǰ��Ե����ʽ����֮�����
fr_nd5=expand(fx4);
I1=double(int(fr_nd5,0,1));                                 % ������,���ٻ���λ��mm^5; 
I1y=(1/2)*Rou*C_avereff*R_wingeff^4*I1;         % ��λ�� mg.mm^2  % I1y=0.0162
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% �ڶ����֡��� ��������������ء��������Ч���۵�������λ��Y_nd
% % ���-ƫ��-����ϵԭ��ľ���
% R_proximal=xr;                                                    % xr=3.19;     %RJ Wood��Ƶĳ��\mm
% R_distal=R_wingeff+xr;                                        % yr=0.73;    %RJ Wood��Ƶĳ��\mm
% x=linspace(R_proximal,R_distal,200);
% yr_lead=-0.08249*x.^6+0.9167*x.^5-4.04*x.^4+8.872*x.^3-10.06*x.^2+5.674*x-0.413-x_mod_Root;  
% yr_trail=-0.0333*x.^6+0.504*x.^5-2.795*x.^4+7.258*x.^3-8.769*x.^2+3.739*x+0.1282-x_mod_Root;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % ����(1)������ǰ��Ե�����������ٻ�yr_leadnd����yr_trailnd�������
% yr_leadnd =-68.4639*r_nd^6+208.297*r_nd^5-245.231*r_nd^4+137.467*r_nd^3-36.8594*r_nd^2+4.79235*r_nd+0.000835197;
% yr_trailnd =-27.6379*r_nd^6+121.093*r_nd^5-185.804*r_nd^4+125.603*r_nd^3-33.1053*r_nd^2-0.145527*r_nd+0.000893019;
%%%%%%%%%%%%%%%%%%%
C_maxy=0.138924474377504; % z_r, ��0.25C_max_LtoT-Pitch�ᵽ�����z-����� % C_max_LtoT =1.3018;% ԭʼ��Ӭ���@���ǰԵ�㵽��С��Ե��ľ���@C_maxy=0;
C_maxynd=C_maxy/C_avereff;
yr_leadnd=yr_leadnd-C_maxynd;
yr_trailnd=yr_trailnd-C_maxynd;
%%%%%%%%%%%%%%%%%%%
% yr_nd1=expand((yr_leadnd^4+yr_trailnd^4)/4);     %��������2
% Z_rnd=double(int(yr_nd1,r_nd,0,1));                         % ���: Y_nd=0.08802(old);  %  mm  % Z_rnd =0.1626;
% ����(2)������ǰԵ�����������ٻ�yr_leadnd�������ٻ��ҳ��ֲ�C_nd���
% y0=yr_trailnd;         % ��ʱ���Z_nd=0.08802; ����������(1)
y0=yr_leadnd-C_nd;   % ��ʱ���Z_nd=0.08802;
y1=yr_leadnd;
yr_nd2=(y1^4+y0^4)/4;   % ע�������Ťת��ֱ��ͨ�����ͳ�������ߣ�ǰԵ�����ĳ��չ������Ψһ
Z_rnd=double(int(yr_nd2,r_nd,0,1));                          % ���: Z_nd=0.08802(old);   %  mm  % Z_rnd =0.1627;
disp(['��Ч���۵�������λ��Z_nd=' num2str(Z_rnd)  ' ���ٵ�λ��mm'])  % �������Maple���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (1) ת�������������ز��������Ƴ�ƽ���µ�չ����
% ����Ϊת��������������ϵ��% mg*mm^-3*mm^5=Kg.m^2:[10^(-12)]= mg.mm^2
M_xrdcoeff=(1/2)*Rou*C_avereff^4*R_wingeff*Z_rnd;  %M_xrdcoeff=9.9528e-005=0.0001;
% (2) ת�������������ز��������Ƴ�ƽ���µ�������
% ����Ϊת��������������ϵ��% mg*mm^-3*mm^5=Kg.m^2:[10^(-12)]= mg.mm^2
fx16=(r_nd+xr_nd)*C_nd^3;                             % ����C_nd��ǰ��Ե����ʽ����֮�����
fr_nd17=expand(fx16);
I8=double(int(fr_nd17,0,1));                                  % ������,���ٻ���λ��mm^5;
I8z=I8;           % ��λ�� mg.mm^2
X_rnd=I8z;
M_zrdcoeff=(1/6)*Rou*C_avereff^3*R_wingeff^2*X_rnd;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% �������֡���ת�����������������ز���
fx6=(r_nd+xr_nd)*C_nd^2;                                  % ����C_nd��ǰ��Ե����ʽ����֮�����   % ������������F_ndRot��ԭʼ��������
fr_nd7=expand(fx6);
% F_ndRot1=double(int(fr_nd7,r_nd,0,1))           % �������Ҳ��Ŷ
F_ndRot=double(int(fr_nd7,0,1));                        % ������,���ٻ���λ��mm^4; F_ndRot=0.7895
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (1) ת��������������������F_yrotcoeff�����Ƴ�ƽ���µķ���   % ��λ��mg*mm^-3*mm^4= kg.m 10^(-9)
F_yrotcoeff=(1/2)*Rou*C_avereff^2*R_wingeff^2*F_ndRot;  % ��λ��mg*mm
% (2) ת�������������ز�������M_xRotcoeff�����Ƴ�ƽ���µ�չ����
% mg*mm^-3*mm^5=Kg.m^2:[10^(-12)]=[10^12*10^(-12)] mg.mm^2
M_xRotcoeff=(1/2)*Rou*C_avereff^3*R_wingeff^2*F_ndRot;   % ת��������������ϵ�������Ƴ�ƽ���µ�Ťת��
% (3) ת�������������ز�������I6y�����Ƴ�ƽ���µ�������
fx8=(r_nd+xr_nd)^2*C_nd^2;                            % ����C_nd��ǰ��Ե����ʽ����֮�����
fr_nd9=expand(fx8);
I2=double(int(fr_nd9,0,1));                                 % ������,���ٻ���λ��mm^5;
I2y=(1/2)*Rou*C_avereff^2*R_wingeff^3*I2;     % ��λ�� mg.mm^2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ���Ĳ��֡���������ЧӦ��ϵ������������ת���������������������������ز���
% C_maxy=0.138924474377504;
% C_maxynd=C_maxy/C_avereff;
yr_hnd=C_nd/2-yr_leadnd+C_maxynd; %ת����ƫ�������е��ƫ��������,��Ťת������ƫ��C_maxy֮��, ���������������۽�ȫ��Ϊ��ֵ
% ����������ϵ��
% a=C_nd/2;
% lambda_z=pi*Rou*a^2;
% lambda_zw=-pi*Rou*a^2*yr_hnd;
% lambda_w=pi*Rou*a^2*yr_hnd^2+pi*Rou*a^4/8;
% dOmega0=-r*(domega_y-omega_x*omega_z);           %������ٶ�
% Z0=-lambda_z*dOmega0-lambda_zw*domega_x;      %������������
% Y0=0;                                                                            %������������
% M0=-lambda_zw*dOmega0-lambda_w*domega_x;    %��������������
%%%%%%%%%%%%%%%%%%%%%%%%
% (1) �������������ز�������������ת������I_xzam�����Ƴ�ƽ���µ�Ťת��
fx10=(r_nd+xr_nd)*C_nd^2*yr_hnd;
fr_nd11=expand(fx10);
I_xzamnd=int(fr_nd11,0,1);
I3=double(I_xzamnd);                                         % ������,���ٻ���λ��mm^5;          % I1 =0.2666;  
I_xzam=pi*Rou*C_avereff^3*R_wingeff^2*I3/4; % ��λ�� mg.mm^2;   % I_xzam =0.0007(old);  I_xzam =0.0021;
% (2) �������������ز�������������ת������I_xxam�����Ƴ�ƽ���µ�Ťת��
fx12=C_nd^2*(yr_hnd^2+C_nd^2/32);
fr_nd13=expand(fx12);
I_xxamnd=int(fr_nd13,0,1);
I4=double(I_xxamnd);                                         % ������,���ٻ���λ��mm^5;          % I2 =0.1637;  
I_xxam=pi*Rou*C_avereff^4*R_wingeff*I4/4;      % ��λ�� mg.mm^2;   % I_xxam=0.0002(old);  I_xxam =6.0288e-004;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (3) ��������������������I5z
I5z=pi*Rou*C_avereff^2*R_wingeff^2*F_ndRot/4;    % ��λ�� mg.mm
I_xzam2=I_xzam+I5z*C_maxynd^2;                   % I_xzam2 =0.0023;
% (4) ��������������������I6z
fx14=C_nd^2*yr_hnd;
fr_nd15=expand(fx14);
I6=double(int(fr_nd15,0,1));                               % ������,���ٻ���λ��mm^4; 
I6z=pi*Rou*C_avereff^3*R_wingeff*I6/4;           % ��λ�� mg.mm  % I6z = 0.0011;
I_xxam2=I_xxam+I6z*C_maxynd^2;                   % I_xxam2 =6.3082e-004;
% (5) �������������ز�������������ת������I7y�����Ƴ�ƽ���µ�������
 I7y=pi*Rou*C_avereff^2*R_wingeff^3*I2/4;     % ��λ�� mg.mm^2
%% (a) ����ѹ�ġ���չ������������/����������% ���ٻ���Ҫ����*C_avereff  or c(r)@r=(R+x_rnd)*r_xcopnd_tr;...
c_zcopnd_tr=I1/F_ndTrans;                            % Y_rcpnd_transaver=0.1715; % *C_avereff  or C(r) @r=R*r_xcopnd_tr;...
c_zcopnd_rot=I2/F_ndRot;                             % Y_rcpnd_rotaver=0.1677;   % *C_avereff  or C(r) @r=R*r_xcopnd_rot;...
% ���������������ɵ�ƽ��ѹ�ġ�����Ӧ����ÿ��Ƭ�������ҵ�
c_zcopnd_addaver=-0.3359; %c_zcopnd_add=M_xam./F_yadd1;%c_zcopnd_addaver=mean(c_zcopnd_add); 
% c_zcopnd_addtr=I3/F_ndRot;   % c_zcopnd_addtr=0.1587;    % *C_avereff or C(r) @r=R*r_xcopnd_addtr;...
% c_zcopnd_addrot=I4/I6;           % c_zcopnd_addrot=0.4816;  % *C_avereff or C(r) @r=R*r_xcopnd_addrot;...
%% (b) չ��ѹ�ġ�����������������/���������� % ���ٻ���Ҫ����*R_wingeff ������  *(R_wingeff+xr)  
% format long
r_xcopnd_tr=I1/F_ndTrans;   % r_xcopnd_tr =0.788691874094779; % r_xcopnd_tr= 0.7887;          % *R_wingeff
r_xcopnd_rot=I2/F_ndRot;    % r_xcopnd_rot =0.712638285096407;  % r_xcopnd_rot =0.7126;        % *R_wingeff  
% չ�������������ɵ�ƽ��ѹ�ġ�����Ӧһ������չ��λ��
r_xcopnd_addaver=0.7934;  % r_xcopnd_add=M_zadd./F_yadd1;  % r_xcopnd_addaver=mean(r_xcopnd_add); 
% r_xcopnd_addtr=I2/F_ndRot;   % r_xcopnd_addtr=0.7126;     % *R_wingeff
% r_xcopnd_addrot=I3/I6;           % r_xcopnd_addrot=0.5837;   % *R_wingeff
% format short
%% (c) չ��ѹ�ġ�����������������/����������
% r_ycopnd_tr1=I1/F_ndTrans;                          % r_ycopnd_tr= 0.7887;
% r_ycopnd_rot1=I2/F_ndRot;                           % r_ycopnd_rot =0.7126;  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ����Aero_F3_fruitfly_exp & Aero_M_fruitfly2����ʵ����Ե�����
% % 20141122-�޸ĺ�����
% wing_para_output=zeros(1,16);
% wing_para_output=[F_ndTrans,Coeff_liftdragF_N,M_xaercoeff,I1y,Z_rnd, M_xrdcoeff,...
%     F_ndRot,F_yrotcoeff,M_xRotcoeff, I2y,...
%     I_xzam,I_xxam, I5z,I6z,I7y,M_zrdcoeff];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%