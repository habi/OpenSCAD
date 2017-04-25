$fn=100;

use <bottom_pin.scad>

difference(){
    translate([0,0,-15])pin(height=15, cap_depth=4);
    cylinder(d=2, h=6, center=true);
}
