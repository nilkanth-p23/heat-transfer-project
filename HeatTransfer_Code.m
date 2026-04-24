% If cubes of different materials (such as copper, aluminum, and wood) are subjected to the same
% heat source, then the materials with higher atomic density and metallic bonding will 
% exhibit the lowest thermal resistance.

clc
clear

% Image upload
metal1 = imread('metals1.1.png');
metal2 = imread('metals2.1.png');
metal3 = imread('metals3.1.png');

nonmetal1 = imread('nonmetals1.1.png');
nonmetal2 = imread('nonmetals2.1.png');
nonmetal3 = imread('nonmetals3.1.png');

%Transform to grayscale 
grayMetal1 = rgb2gray(metal1); 
grayMetal2 = rgb2gray(metal2); 
grayMetal3 = rgb2gray(metal3);

grayNonmetal1 = rgb2gray(nonmetal1);
grayNonmetal2 = rgb2gray(nonmetal2); 
grayNonmetal3 = rgb2gray(nonmetal3);

%Average
metalMean1 = mean(double(grayMetal1), 2);
metalMean2 = mean(double(grayMetal2), 2);
metalMean3 = mean(double(grayMetal3), 2);
nonmetalMean1 = mean(double(grayNonmetal1), 2);
nonmetalMean2 = mean(double(grayNonmetal2), 2);
nonmetalMean3 = mean(double(grayNonmetal3), 2);

%Temprature 
T_min_C = [28.1, 26.8, 26.1;    % Metal trials 1, 2, 3
           26.9, 26.5, 23.3];   % Nonmetal trials 1, 2, 3

T_max_C = [117.2, 96.1, 98.1;  % Metal trials 1, 2, 3
           122.2, 125.6, 102.8];


%R=L/(ka) 
kCopper = 401;
kAluminum = 237;
kBrass = 109; 
kSteel = 15.1; 
kAcrylic = 0.19;
kPine = 0.12;
kPVC = 0.19; 
kNylon = 0.25;

%Cube 
L = 0.0254;

%Scaling
scaledMetal1 = T_min_C(1,1) + (T_max_C(1,1) - T_min_C(1,1)) .* (metalMean1 - min(metalMean1)) ./   (max(metalMean1) - min(metalMean1));
scaledMetal2 = T_min_C(1,2) + (T_max_C(1,2) - T_min_C(1,2)) .* (metalMean2 - min(metalMean2)) ./ (max(metalMean2) - min(metalMean2));
scaledMetal3 = T_min_C(1,3) + (T_max_C(1,3) - T_min_C(1,3)) .* (metalMean3 - min(metalMean3)) ./ (max(metalMean3) - min(metalMean3));

scaledNonmetal1 = T_min_C(2,1) + (T_max_C(2,1) - T_min_C(2,1)) .* (nonmetalMean1 - min(nonmetalMean1)) ./ (max(nonmetalMean1) - min(nonmetalMean1));
scaledNonmetal2 = T_min_C(2,2) + (T_max_C(2,2) - T_min_C(2,2)) .* (nonmetalMean2 - min(nonmetalMean2)) ./ (max(nonmetalMean2) - min(nonmetalMean2));
scaledNonmetal3 = T_min_C(2,3) + (T_max_C(2,3) - T_min_C(2,3)) .* (nonmetalMean3 - min(nonmetalMean3)) ./ (max(nonmetalMean3) - min(nonmetalMean3));

%Pixel height of each image
nMetal1    = size(scaledMetal1, 1);
nMetal2    = size(scaledMetal2, 1);
nMetal3    = size(scaledMetal3, 1);
nNonmetal1 = size(scaledNonmetal1, 1);
nNonmetal2 = size(scaledNonmetal2, 1);
nNonmetal3 = size(scaledNonmetal3, 1);

heightMetal1    = linspace(0, nMetal1,    nMetal1);
heightMetal2    = linspace(0, nMetal2,    nMetal2);
heightMetal3    = linspace(0, nMetal3,    nMetal3);
heightNonmetal1 = linspace(0, nNonmetal1, nNonmetal1);
heightNonmetal2 = linspace(0, nNonmetal2, nNonmetal2);
heightNonmetal3 = linspace(0, nNonmetal3, nNonmetal3);

%Graph for individual metal trials
figure(1);

hold on; %% add all the graphs on one graph
plot(heightMetal1, scaledMetal1, 'r-', 'Linewidth', 2, 'DisplayName', 'Brass, Steel, Copper');
plot(heightMetal2, scaledMetal2, 'b-', 'Linewidth', 2, 'DisplayName', 'Brass, Aluminium, Copper');
plot(heightMetal3, scaledMetal3, 'g-', 'Linewidth', 2, 'DisplayName', 'Copper, Steel, Brass');
hold off;

xlabel('Cube Height');
ylabel('Temperature (°C)');
title('Thermal Gradient – Metal Trials');
legend('show');
grid on;

%Graph for individual nonmetal trials
figure(2);

hold on;
plot(heightNonmetal1, scaledNonmetal1, 'r-', 'Linewidth', 2, 'DisplayName', 'Acrylic, Pinewood, PVC');
plot(heightNonmetal2, scaledNonmetal2, 'b-', 'Linewidth', 2, 'DisplayName', 'Nylon, Acrylic, Nylon');
plot(heightNonmetal3, scaledNonmetal3, 'g-', 'Linewidth', 2, 'DisplayName', 'PVC, Pinewood, Acrylic');
hold off;

xlabel('Cube Height');
ylabel('Temperature (°C)');
title('Thermal Gradient – Nonmetal Trials');
legend('show');
grid on;

%Avereging metals and nonmetals separetely and graphing
N= 100; 
scaledMetal1Avg    = scaledMetal1(round(linspace(1, size(scaledMetal1,1),    N)));
scaledMetal2Avg    = scaledMetal2(round(linspace(1, size(scaledMetal2,1),    N)));
scaledMetal3Avg    = scaledMetal3(round(linspace(1, size(scaledMetal3,1),    N)));
scaledNonmetal1Avg = scaledNonmetal1(round(linspace(1, size(scaledNonmetal1,1), N)));
scaledNonmetal2Avg = scaledNonmetal2(round(linspace(1, size(scaledNonmetal2,1), N)));
scaledNonmetal3Avg = scaledNonmetal3(round(linspace(1, size(scaledNonmetal3,1), N)));


avgMetal    = (scaledMetal1Avg + scaledMetal2Avg + scaledMetal3Avg) / 3;
avgNonmetal = (scaledNonmetal1Avg + scaledNonmetal2Avg + scaledNonmetal3Avg) / 3;

figure(3);
hold on;
plot(avgMetal,'b-', 'Linewidth', 2, 'DisplayName', 'Average of Metals');
plot(avgNonmetal,'r-', 'Linewidth', 2, 'DisplayName', 'Average of Nonmetals');
hold off;
xlabel('Cube Height');
ylabel('Temperature (°C)');
title('Thermal Gradient: Metals vs. Nonmetals');
legend('show');
grid on;

%Thermal Resistance Calculations 
A = L^2;   % 1" × 1" face area in m²

% Individual resistances
R_copper   = L / (kCopper   * A);
R_aluminum = L / (kAluminum * A);
R_brass    = L / (kBrass    * A);
R_steel    = L / (kSteel    * A);
R_acrylic  = L / (kAcrylic  * A);
R_pine     = L / (kPine     * A);
R_PVC      = L / (kPVC      * A);
R_nylon    = L / (kNylon    * A);

%R values

Rmetal1 = round(R_copper + R_steel + R_brass, 4);
Rmetal2 = round(R_copper + R_aluminum + R_brass, 4);
Rmetal3 = round(R_brass + R_steel + R_copper, 4);
Rnonmetal1 = round(R_PVC + R_pine + R_acrylic, 4);
Rnonmetal2 = round(R_nylon + R_acrylic + R_nylon, 4); 
Rnonmetal3 = round(R_acrylic + R_pine + R_PVC, 4);


fprintf("The resistance of the three metal stacks are: %f, %f, %f\n", Rmetal1, Rmetal2, Rmetal3);
fprintf("The resistance of the three nonometal stacks are: %f, %f, %f\n", Rnonmetal1, Rnonmetal2, Rnonmetal3);

%QExperimental
TempTopMetal1    = scaledMetal1(1);    % top of stack (coldest)
TempBottomMetal1 = scaledMetal1(end);  % bottom of stack (hotplate side)
TempTopNonmetal1    = scaledNonmetal1(1);
TempBottomNonmetal1 = scaledNonmetal1(end);

QexpMetal    = (TempBottomMetal1    - TempTopMetal1) / Rmetal1;
QexpNonmetal = (TempBottomNonmetal1 - TempTopNonmetal1) / Rnonmetal1; 

fprintf("The experimental Q of the first metal and nonmetal stacks are %f, %f respectively.\n", QexpMetal, QexpNonmetal);

%QEstimate
TBrass = 117.2;
TBrass1 = 105.3;
TSteel = 76.1;
TSteel1 = 60.1;
TCopper = 35.4;
TCopper1 = 30.1;

QBrass = (TBrass - TBrass1) / R_brass;
QSteel = (TSteel - TSteel1) / R_steel;
QCopper = (TCopper - TCopper1) / R_copper;

QestMetalStack = QBrass + QSteel + QCopper; 
PercentErrorMetal = abs(QexpMetal - QestMetalStack) / QestMetalStack * 100;
fprintf("The estimated Q value for the metal stack is %f W. And the percent error is %f.\n",  QestMetalStack, PercentErrorMetal);

TPVC = 114.7 ;
TPVC1 = 77.1 ;
TPine = 75.3;
TPine1 = 44.1;
TAcrylic = 42.4;
TAcrylic1 = 28.1;

QPVC     = (TPVC     - TPVC1)     / R_PVC;
QPine    = (TPine    - TPine1)    / R_pine;
QAcrylic = (TAcrylic - TAcrylic1) / R_acrylic;
QestNonmetalStack = QPVC + QPine + QAcrylic;
PercentErrorNonmetal = abs(QexpNonmetal - QestNonmetalStack) / QestNonmetalStack * 100;
fprintf("The estimated Q value for the nonmetal stack is %f W. And the percent error is %f.\n", QestNonmetalStack, PercentErrorNonmetal);