// Sample holder for Mathias' zebrafish head
$fn = 100;

use <bottom_pin.scad>

// Bottom pin
pin(height=20);

// Cup
height=12;
upper_radius=4;
lower_radius=2;
wall_thickness=0.3;
scale([1,.618,1]) {
    difference() {
    cylinder(h=height, r1=lower_radius+wall_thickness, r2=upper_radius+wall_thickness);
    translate([0,0,1]) cylinder(h=height, r1=lower_radius, r2=upper_radius);
    }
}