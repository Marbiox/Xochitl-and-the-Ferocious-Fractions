numeratorValue = instance_place(x,y,oNumerator).value;
denominatorValue = instance_place(x,y,oDenominator).value;

if numeratorValue == noone || denominatorValue == noone { value = noone }
else value = numeratorValue / denominatorValue;
