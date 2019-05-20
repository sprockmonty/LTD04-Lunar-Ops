%nuclear engine estimates

mempty = 5;  %kg
distEarth2Moon = 384400000; %meters
SGP = 3.986e14; %standard gravitational parameter
Vmoon = (SGP / distEarth2Moon)^0.5;
ge=9.81;
Isp = 900;
gm = 1.62; 
mprop = mempty*exp(Vmoon/(Isp*ge)) - mempty; 


%using KRUSTY engine
specificPower = 4000e6/34000; %W/kg
reactorMass = 0:1000;

mtotal = mprop + mempty + reactorMass;
thrust = mtotal * gm;

power = thrust * Isp * ge/2;
plot(mtotal, power)
hold on
plot(mtotal,reactorMass*specificPower)
legend("power required", "power provided")