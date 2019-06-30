## Create new FIS.
a = newfis ('Smart-Greenhouse', 'mamdani');

## Add three inputs and their membership functions.
a = addvar (a, 'input', 'Temperature', [0 40]);
a = addmf (a, 'input', 1, 'Low', 'trapmf', [-1 0 25 30]);
a = addmf (a, 'input', 1, 'Medium', 'trapmf', [25 28 32 35]);
a = addmf (a, 'input', 1, 'High', 'trapmf', [30 35 40 41]);

a = addvar (a, 'input', 'Humidity', [0 100]);
a = addmf (a, 'input', 2, 'Low', 'trapmf', [-1 0 40 50]);
a = addmf (a, 'input', 2, 'Medium', 'trapmf', [40 45 55 70]);
a = addmf (a, 'input', 2, 'High', 'trapmf', [60 70 100 101]);

a = addvar (a, 'input', 'DLI', [0 14]);
a = addmf (a, 'input', 3, 'Low', 'trapmf', [-1 0 6 7]);
a = addmf (a, 'input', 3, 'Medium', 'trapmf', [6 7 9 10]);
a = addmf (a, 'input', 3, 'High', 'trapmf', [9 10 14 15]);

## Add two outputs and its membership functions.
a = addvar (a, 'output', 'Water Pump Speed', [0 30]);
a = addmf (a, 'output', 1, 'Low', 'trapmf', [-1 0 10 15]);
a = addmf (a, 'output', 1, 'Medium', 'trapmf', [10 15 20 25]);
a = addmf (a, 'output', 1, 'High', 'trapmf', [20 25 30 31]);

a = addvar (a, 'output', 'Fan Speed', [500 3000]);
a = addmf (a, 'output', 2, 'Low', 'trapmf', [499 500 1250 1500]);
a = addmf (a, 'output', 2, 'Medium', 'trapmf', [1250 1500 2000 2250]);
a = addmf (a, 'output', 2, 'High', 'trapmf', [2000 2250 3000 3001]);

## Plot the input and output membership functions.
#plotmf (a, 'input', 1);
#plotmf (a, 'input', 2);
#plotmf (a, 'input', 3);
#plotmf (a, 'output', 1);
#plotmf (a, 'output', 2);

## Add 15 rules and display them in verbose format.
a = addrule (a, [1 3 1 1 1 1 1; 1 3 2 1 1 1 1; 
                 1 3 3 1 2 1 1; 2 3 2 1 2 1 1;
                 2 2 2 2 2 1 1; 2 2 3 2 2 1 1;
                 3 2 2 2 3 1 1; 3 1 2 3 2 1 1;
                 3 1 3 3 3 1 1; 3 2 1 3 3 1 1]);
puts ("\nOutput of showrule(a):\n\n");
showrule (a);

## Plot the output as a function of the two inputs.
#gensurf (a);

output = evalfis([5 95 3],a);
puts("Water pump speed (l/h):");
disp(output(1));
puts("Fan speed (rpm):");
disp(output(2));
