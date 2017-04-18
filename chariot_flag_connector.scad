// Connector piece for the two flag pole pieces on the chariot
$fn=100;
innerdiameter=5;
height=50;
difference() {
    hull() { // 'hull' makes the tapered outer shell
        union() { // 'union' to connect the cylinder and spokes together
            cylinder(d=innerdiameter+3, h=height, center=true);
            // spokes
            for (angle =[0:45:180]) 
                rotate([0,0,angle])
                    cube([innerdiameter+7,1,10],center=true);
            }
        }
        // central hole
        #cylinder(d=innerdiameter, h=height+2, center=true);
    }
// separator
for (angle =[0:45:180])
    rotate([0,0,angle])
        cube([innerdiameter,1,5],center=true);
// friction stuff in the center
for (angle =[0:120:360]) 
    rotate([0,0,angle])
        translate([innerdiameter/2,0,0])
            cylinder(d=0.5, h=height, center=true);