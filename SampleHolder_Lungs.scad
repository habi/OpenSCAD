$fn=100;
bottom_pin_diameter = 6.2;

module sampleholder() {}

x=15;
y=15;
thickness=1.5;
angle=20;
height=25;
diameter=20;
wall_thickness=2;
difference() {
    union(){
        difference() {
            union() {
                rotate([0,50,0]) {
                    rotate([angle, 0, 0]) cube([x, y, thickness], center=true);
                    translate([0,cos(angle)*y-cos(1),0]) rotate([-angle, 0, 0]) cube([x, y, thickness], center=true);
                }
                translate([2,0.5*cos(angle)*y,-8]) {
                    difference() {
                        cylinder(d=diameter+wall_thickness, h=height);
                        cylinder(d=diameter, h=3*height, center=true);
                    }
                }
            }
            translate([2,0.5*cos(angle)*y,-0.5*height]) {
                difference() {
                    cylinder(d=2*diameter, h=1.5*height);
                    cylinder(d=diameter+1.2*wall_thickness, h=1.5*height);
                }
            }
        }
        translate([2,0.5*cos(angle)*y,-7.5]) {
            for (a=[0:45:180]) {
                rotate([0,0,a]) cube([diameter+wall_thickness, 1, 2], center=true);
            }
            translate([0,0,-9]) cylinder(d=6.25, h=20, center=true);
        }
    }
    translate([-2,0.5*cos(angle)*y,14]) #cube([15,25,15], center=true);
}