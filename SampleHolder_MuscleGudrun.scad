$fn=100;
bottom_pin_diameter = 6.2;

module sampleholder(cylinder_height,
                    cylinder_diameter_bottom,
                    cylinder_diameter_top,
                    squash=0.6,
                    wall_thickness=1.5,
                    pin_height=20,
                    ) {
    difference() { // Cut out cylinder with given diameter from cylinder with given diameter plus wall thickness
        union() { // Collect the bottom pin and the cylinder
            cylinder(d=6.25, h=pin_height+2); // Bottom pin
            scale([1, squash, 1]) { // squash the cylinder height if desired
                translate([0,0,pin_height]) { // Move the actual holder cylinder up
                    cylinder(d1=cylinder_diameter_bottom+wall_thickness, d2=cylinder_diameter_top+wall_thickness, h=15);
                    translate([0,0,15]) {
                        cylinder(d=cylinder_diameter_top+wall_thickness, h=cylinder_height);
                        }
                    }
                }
            }
            translate([0,0,pin_height+wall_thickness]) { // Move the "drill" up
                scale([1, squash, 1]) { // squash the cylinder if desired
                    cylinder(d1=cylinder_diameter_bottom, d2=cylinder_diameter_top, h=15-wall_thickness);
                    translate([0,0,15-wall_thickness]) {
                        #cylinder(d=cylinder_diameter_top, h=cylinder_height+wall_thickness);
                        }
                    }
                }
            }
        }
            
module cover(cylinder_diameter_top, squash, wall_thickness=1.5, lid_height=3, nibble_length=2, nibble_diameter=2) {
    scale([1, squash, 1]) { // squash the cylinder height if desired
        difference() {
            cylinder(d=cylinder_diameter_top-0.5, h=lid_height);
            cylinder(d=cylinder_diameter_top-0.5-wall_thickness, h=lid_height);
        }
        translate([0,0,lid_height]) cylinder(d=cylinder_diameter_top+wall_thickness, h=1);
    }
    translate([0,0,lid_height+1]) {
        cylinder(d=2, h=nibble_length);
        translate([0,0,nibble_length+nibble_diameter/2]) sphere(nibble_diameter);
        }
    }
    
top_diameter=15;
squash=0.5;

sampleholder(40, 6.2, top_diameter, squash);
translate([0,0,80]) cover(top_diameter, squash);
