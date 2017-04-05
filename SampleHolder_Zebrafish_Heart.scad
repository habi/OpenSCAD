$fn = 100;

use <bottom_pin.scad>

// Bottom pin
translate([0,0,-18]) pin(height=20);

// pretty
//for (i=[0:10])
//   rotate([0,0,i*36])
//     translate([0.5,0,0]) rotate([0,33,0])cube([0.5,3,10], center=true);

// useful
difference() {
    height=7;
    bottom_diameter=2;
    top_diameter=3.5;
    cylinder(h=height, d1=bottom_diameter, d2=top_diameter);
    translate([0,0,2.5])cylinder(h=height, d1=bottom_diameter, d2=top_diameter);    
}