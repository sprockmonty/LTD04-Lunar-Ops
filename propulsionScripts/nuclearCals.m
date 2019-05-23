%nuclear engine estimates

mpayload = 5;  %kg
reactorMass = 0:200;
mempty = mpayload+reactorMass;
distEarth2Moon = 384400000; %meters
SGP = 3.986e14; %standard gravitational parameter
Vmoon = (SGP / distEarth2Moon)^0.5;
ge=9.81;
Isp = 900;
gm = 1.62; 
mprop = mempty*exp(Vmoon/(Isp*ge)) - mempty; 


%using KRUSTY engine
specificPower = 10000; %W/kg
specificThrust = 73396/2478; %N/kg, from rubber NTR sizing

mtotal = mprop + mempty;
thrust = mtotal * gm;

power = thrust * Isp * ge/2;
plot(mtotal, thrust)
hold on
plot(mtotal,specificThrust*reactorMass)
legend("thrust required", "thrust provided")