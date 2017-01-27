$fn=100;

thickness = 1;
cube([70,4,thickness], center=true);
distance = 65;

module pin()
    difference(){
        cylinder(d=4.5,h=15);
        cylinder(d=2.5,h=15);
    }
translate([-distance/2,0,thickness/2]) pin();
translate([distance/2,0,thickness/2]) pin();