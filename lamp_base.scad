$fn=25;

thickness = 2;
cube([95,95,thickness], center=true);
distance = 65;

module pin()
    difference(){
        cylinder(d=5,h=15);
        translate([0,0,thickness]) cylinder(d=3,h=15);
    }
translate([-distance/2,0,-thickness/2]) pin();
translate([distance/2,0,-thickness/2]) pin();