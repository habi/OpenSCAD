// Extrusion based on OpenSCAD example offset.scad
$fn = 100;

use <bottom_pin.scad>

cylinder_diameter=10;
wall_thickness=1;
plate_thickness=1.5;

module outline(wall=wall_thickness) {
  difference() {
    offset(wall) children();
    offset(0) children();
  }
}

// Bottom pin
pin(height=20);

// Bottom plate
difference() {
    linear_extrude(height=plate_thickness) circle(1.25*cylinder_diameter, center = true);
    //for (angle=[0:72:359]) {
    //    rotate([0,0,angle+72/2]) translate([1.5*cylinder_diameter, 0, 0.5*plate_thickness]) scale([1,0.618,1]) cylinder(d=cylinder_diameter, h=plate_thickness*2, center=true);
    //}
    }

module cover(diameter=cylinder_diameter, wall=wall_thickness, lid_height=2, nibble_length=2, nibble_diameter=2) {
    difference() {
        cylinder(d=diameter-0.8, h=lid_height);
        cylinder(d=diameter-0.8-wall, h=lid_height);
    }
    translate([0,0,lid_height]) cylinder(d=diameter+wall, h=1);
    translate([0,0,lid_height+1]) {
        cylinder(d=2, h=nibble_length);
        translate([0,0,nibble_length+nibble_diameter/2]) sphere(nibble_diameter);
        }
    }

module holder(cylinder_height=15, inner_diameter=cylinder_diameter, squash=0.518) {
    translate([0, 0, plate_thickness]) {
        scale([1,squash,1])
        linear_extrude(height=cylinder_height) {
            outline() circle(d=inner_diameter);
            }
        }
    translate([0,0,plate_thickness+cylinder_height+5]) scale([1,squash,1]) cover();
    }

difference() {
    for (angle=[0:72:359]) {
        rotate([0,0,angle]) translate([cylinder_diameter-4.1*wall_thickness, 0, 0]) holder();
        }
    // "Drill" out the central part so that we can actually put the lids on, and make separation walls
    translate([0,0,plate_thickness]) {cylinder(d=9, h=16);}
}
// Separation wall
for (angle=[0:72:359]) {
        rotate([0,0,angle+19]) translate([-0.5, -0.5, 0]) cube([1,5.5,14], center=false);
        }

// Cylinder markers
markerdiameter=1.75;
// below the plate
for (counter=[0:1:4]) {
	for (angle=[0:72:359-counter*72]) {
		rotate([0,0,angle]) translate([0.45*cylinder_diameter+counter*markerdiameter, 0, -0.9]) cylinder(d=markerdiameter,h=1);
		}
	}
// at the sides of the cylinders
for (counter=[0:1:4]) {
	for (angle=[0:72:359-counter*72]) {
		rotate([0,0,angle+27+counter*5*markerdiameter-8*markerdiameter]) translate([1.1*cylinder_diameter, 0, plate_thickness]) cylinder(d=markerdiameter,h=1);
		}
	}
