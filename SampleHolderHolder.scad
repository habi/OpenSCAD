// Based on OpenSCAD example offset.scad
$fn = 100;

plate_thickness = 3;

module outline(wall = 2) {
  difference() {
    offset(wall) children();
    offset(0) children();
  }
}

linear_extrude(height = plate_thickness) {
    offset(1) { // offsetting with a positive value allows to create rounded corners easily
        square([7.5, 30], center = true);
        rotate([0,0,90]) square([7.5, 30], center = true);
    }
}

module hole_and_pin(pin_height=10) { // Hole and pin
    translate([0, 0, plate_thickness]) {
        linear_extrude(height=pin_height) {
            outline() circle(d=6.5);
            }
        }
    translate([0, 0, plate_thickness]) %cylinder(d = 6.25,h=pin_height+1);
    }

hole_and_pin();