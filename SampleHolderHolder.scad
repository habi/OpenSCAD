// Based on OpenSCAD example offset.scad

$fn = 100;

plate_thickness = 3;

echo(version=version());

module outline(wall = 1) {
  difference() {
    offset(wall) children();
    offset(0) children();
  }
}

// offsetting with a positive value allows to create rounded corners easily
linear_extrude(height = plate_thickness) {
  offset(5) {
    square([5, 25], center = true);
  }
    %square([5, 25], center = true);  
}


translate([0, 0, plate_thickness]) {
  linear_extrude(height = 5) {
        outline(wall=0.5) circle(d=6.5);
      }
}

%cylinder(d = 6.25, h = 20);