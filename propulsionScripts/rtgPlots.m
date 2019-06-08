clear
clc
close all

%x axis power required
%y axis mass of plutonium

powerRange = 1:100:2500;
puPerCell = 0.45; %mass of plutonium per module
sterlingRTGDataTMass = [113,207,319,440;...
    17.3, 32, 46.8, 64.5];
sterlingRTGDatapu = [sterlingRTGDataTMass(1,:);...
    2*puPerCell, 4*puPerCell, 6*puPerCell, 8*puPerCell];

sterlingRTGTMass = polyval(polyfit(sterlingRTGDataTMass(1,:),sterlingRTGDataTMass(2,:),1), powerRange);
sterlingRTGpu = polyval(polyfit(sterlingRTGDatapu(1,:),sterlingRTGDatapu(2,:),1), powerRange);

figure
hold on
%scatter(sterlingRTGDataTMass(1,:),sterlingRTGDataTMass(2,:),'xb')
scatter(sterlingRTGDatapu(1,:),sterlingRTGDatapu(2,:),'xr')
%plot(powerRange,sterlingRTGTMass,'b')
puPlot = plot(powerRange,sterlingRTGpu,'r');
puAvailablePlot =plot(powerRange, powerRange.*0 + 10);
xlabel("Power required (W)")
ylabel("Mass (kg)")
legend([puPlot,puAvailablePlot], 'Mass of plutonium 238 required using high power SRG',...
    'Total reserves of plutionium 238 available to Nasa in 2025')