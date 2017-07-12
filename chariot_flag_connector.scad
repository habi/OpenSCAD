// Connector piece for the two flag pole pieces on the chariot
$fn=100;
innerdiameter=6.6;
height=60; // was around ~75
difference() {
    union() {
        for (angle =[0:60:180-60])
        rotate([0,0,angle])
            hull() { // 'hull' generates the tapered outer shell over the spokes
                // spokes
                cube([innerdiameter+14,2,15], center=true);
                // outer cylinder (we probably should only generate it once, but the 'hull' is much prettier like this :)
                cylinder(d=innerdiameter+2, h=height, center=true);
              }
            }            
        // central bore hole
        #cylinder(d=innerdiameter, h=height+4, center=true);
    }
// rings
for (tr=[-5:5:5])
    translate([0,0,tr]) rotate_extrude(convexity=10) translate([innerdiameter+2.85, 0, 0]) circle(r = 1);
for (tr=[-10,10])
    translate([0,0,tr]) rotate_extrude(convexity=10) translate([innerdiameter+2.1, 0, 0]) circle(r = 1);
for (tr=[-15,15])
    translate([0,0,tr]) rotate_extrude(convexity=10) translate([innerdiameter+0.75, 0, 0]) circle(r = 1);
// inner middle separator
for (angle =[0:60:180-60])
    rotate([0,0,angle])
        cube([innerdiameter,1,3],center=true);
// friction stuff around the hole
for (angle =[0:120:360]) 
    rotate([0,0,angle])
        translate([innerdiameter/2,0,0])
            cube([0.5, innerdiameter/2, height], center=true);