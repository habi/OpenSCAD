// Extrusion based on OpenSCAD example offset.scad
$fn = 100;

cylinder_diameter=10;
wall_thickness=1;
plate_thickness=2;

module outline(wall=wall_thickness) {
  difference() {
    offset(wall) children();
    offset(0) children();
  }
}

// Bottom pin
translate([0,0,-20]) cylinder(d=6.2, h=20);
// Bottom plate
difference() {
    linear_extrude(height=plate_thickness) circle(1.55*cylinder_diameter, center = true);
    for (angle=[0:72:359]) {
        rotate([0,0,angle+72/2]) translate([1.5*cylinder_diameter, 0, 0.5*plate_thickness]) scale([1,0.618,1]) cylinder(d=cylinder_diameter, h=plate_thickness*2, center=true);
        }
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

module holder(cylinder_height=15, inner_diameter=cylinder_diameter, squash=0.618) {
    translate([0, 0, plate_thickness]) {
        scale([1,squash,1])
        linear_extrude(height=cylinder_height) {
            outline() circle(d=inner_diameter);
            }
        }
    translate([0,0,plate_thickness+cylinder_height+3]) scale([1,squash,1]) cover();
    }

for (angle=[0:72:359]) {
    rotate([0,0,angle]) translate([cylinder_diameter-1.5*wall_thickness, 0, 0]) holder();
    }

// Cylinder markers 
markerdiameter=1.5;
for (counter=[0:1:4]) {
	for (angle=[0:72:359-counter*72]) {
		rotate([0,0,angle]) translate([0.5*cylinder_diameter+counter*markerdiameter, 0, plate_thickness]) cylinder(d=markerdiameter,h=1);
		}
	}
for (counter=[0:1:4]) {
	for (angle=[0:72:359-counter*72]) {
		rotate([0,0,angle+counter*4*markerdiameter-8*markerdiameter]) translate([1.5*cylinder_diameter, 0, plate_thickness]) cylinder(d=markerdiameter,h=1);
		}
	}	