// Sample holder for Ines' zebrafish hearts
$fn = 100;

use <bottom_pin.scad>

// Bottom pin
pin(height=25);

// Cup
height=10;
inner_radius=1.5;
wall_thickness=0.3;
difference() {
    cylinder(h=height, r1=inner_radius+wall_thickness, r2=inner_radius+wall_thickness+1);
    translate([0,0,1]) cylinder(h=height, r1=inner_radius, r2=inner_radius+1);
}