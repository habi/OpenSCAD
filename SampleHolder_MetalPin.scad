$fn=100;

use <bottom_pin.scad>

difference(){
    translate([0,0,-25])pin(height=25, cap_depth=4);
    cylinder(d=2, h=6, center=true);
}
