// Extrusion based on OpenSCAD example offset.scad
$fn = 100;

cylinder_diameter=18;
wall_thickness=1;
plate_thickness=2;

module outline(wall=wall_thickness) {
  difference() {
    offset(wall) children();
    offset(0) children();
  }
}

translate([0,0,-20])cylinder(d=6.2, h=20);
difference() {
    linear_extrude(height=plate_thickness) circle(1.55*cylinder_diameter, center = true);
    for (angle=[0:72:359]) {
        rotate([0,0,angle+72/2]) translate([2*cylinder_diameter, 0, 0.5*plate_thickness]) scale([1,0.618,1]) cylinder(d=37, h=plate_thickness*2, center=true);
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

module holder(cylinder_height=25, inner_diameter=cylinder_diameter, squash=0.6) {
    translate([0, 0, plate_thickness]) {
        scale([1,squash,1])
        linear_extrude(height=cylinder_height) {
            outline() circle(d=inner_diameter);
            }
        }
    translate([0,0,plate_thickness+cylinder_height+3]) scale([1,squash,1]) cover();
    }

 for (angle=[0:72:359]) {
     %rotate([0,0,angle]) translate([cylinder_diameter-1.5*wall_thickness, 0, 0]) holder();
     }

for (angle=[0:72:359]) {
    rotate([0,0,angle]) translate([0.9*cylinder_diameter, 0, plate_thickness]) cylinder(d=2,h=1);
    }
for (angle=[0:72:359-1*72]) {
     rotate([0,0,angle]) translate([0.9*cylinder_diameter+1*2, 0, plate_thickness]) cylinder(d=2,h=1);
 }  
for (angle=[0:72:359-2*72]) {
     rotate([0,0,angle]) translate([0.9*cylinder_diameter+2*2, 0, plate_thickness]) cylinder(d=2,h=1);
 }   
for (angle=[0:72:359-3*72]) {
     rotate([0,0,angle]) translate([0.9*cylinder_diameter+3*2, 0, plate_thickness]) cylinder(d=2,h=1);
 }    
for (angle=[0:72:359-4*72]) {
     rotate([0,0,angle]) translate([0.9*cylinder_diameter+4*2, 0, plate_thickness]) cylinder(d=2,h=1);
 }    