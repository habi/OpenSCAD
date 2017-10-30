$fn=100;

use <bottom_pin.scad>

x=15;
y=15;
thickness=1.5;
angle=18;
height=20;
diameter=20;
wall_thickness=1.5;
difference() {
    union(){
        difference() {
            union() {
                // lung stopper
                translate([10,cos(angle)*0.5*y-cos(1),0]) cube([1,diameter,height], center=true);
                rotate([0,45,0]) {
                    // "book" lung holder
                    rotate([angle, 0, 0]) cube([x, y, thickness], center=true);
                    translate([0,cos(angle)*y-cos(1),0]) rotate([-angle, 0, 0]) cube([x, y, thickness], center=true);
                }
                translate([2,0.5*cos(angle)*y,0]) {
                    difference() {
                        // wall
                        cylinder(d=diameter+wall_thickness, h=height, center=true);
                        cylinder(d=diameter, h=1.2*height, center=true);
                    }
                }
            }
            translate([2,0.5*cos(angle)*y,-0.5*height]) {
                difference() {
                    // outer cutoff
                    cylinder(d=1.75*diameter, h=height);
                    cylinder(d=diameter+1.2*wall_thickness, h=height);
                }
            }
        }
        translate([2,0.5*cos(angle)*y,-0.5*height+1]) {
            // spokes
            for (a=[0:45:180]) {
                rotate([0,0,a]) cube([diameter+wall_thickness, 1, 2], center=true);
            }
            pin(height=20);
        }
    }
}