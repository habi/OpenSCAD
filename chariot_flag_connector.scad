// Connector piece for the two flag pole pieces on the chariot
$fn=100;
innerdiameter=7;
height=20; // should be ~75, but we first do a test-print...
difference() {
    for (angle =[0:45:180-45])
        rotate([0,0,angle])
            hull() { // 'hull' generates the tapered outer shell over the spokes
                // spokes
                cube([innerdiameter+7,0.5,10], center=true);
                // outer cylinder (we probably should only generate it once, but the 'hull' is much prettier like this :)
                cylinder(d=innerdiameter+3, h=height, center=true);
                }
        // central bore hole
        #cylinder(d=innerdiameter, h=height+4, center=true);
    }
// inner middle separator
for (angle =[0:45:180])
    rotate([0,0,angle])
        cube([innerdiameter,1,5],center=true);
// friction stuff around the hole
for (angle =[0:120:360]) 
    rotate([0,0,angle])
        translate([innerdiameter/2,0,0])
            cube([0.5,innerdiameter/2, height], center=true);