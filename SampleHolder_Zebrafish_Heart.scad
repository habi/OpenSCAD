// Sample holder for Ines' zebrafish hearts
$fn = 100;

use <bottom_pin.scad>

// Bottom pin
pin(height=30);

// Cup
height=10;
inner_radius=2.5;
wall_thickness=0.5;
difference() {
    cylinder(h=height, r=inner_radius+wall_thickness);
    translate([0,0,1]) cylinder(h=height, r=inner_radius);
}