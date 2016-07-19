// Based on OpenSCAD example offset.scad
$fn = 100;

plate_thickness = 3;

module outline(wall = 1) {
  difference() {
    offset(wall) children();
    offset(0) children();
  }
}

linear_extrude(height = plate_thickness) {
    offset(1) { // offsetting with a positive value allows to create rounded corners easily
        square([7.5, 50], center = true);
        rotate([0,0,90]) square([7.5, 30], center = true);
    }
}

module hole_and_pin() { // Hole and pin
    translate([0, 0, plate_thickness]) {
    linear_extrude(height = 5) {
            outline(wall=1) circle(d=7);
        }
    }
    translate([0, 0, plate_thickness]) %cylinder(d = 6.25, h = 10);
}

translate([0,-20,0]) hole_and_pin();
translate([0,-10,0]) hole_and_pin();
translate([0,  0,0]) hole_and_pin();
translate([0, 10,0]) hole_and_pin();
translate([0, 20,0]) hole_and_pin();

translate([-10, 0,0]) hole_and_pin();
translate([  0, 0,0]) hole_and_pin();
translate([ 10, 0,0]) hole_and_pin();