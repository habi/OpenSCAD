$fn=100;

module sampleholder(cylinder_height,
                    cylinder_diameter,
                    wall_thickness=1.5,
                    pin_height=20,
                    ) {
    difference() { // Cut out cylinder with given diameter from cylinder with given diameter plus wall thickness
        union() { // Collect the bottom pin and the cylinder
            cylinder(d=6.25, h=pin_height); // Bottom pin
            scale([1, 0.6, 1]) { // squash the sphere height if desired
                translate([0,0,pin_height]) { // Move the actual holder cylinder up
                    cylinder(d=cylinder_diameter+wall_thickness,h=cylinder_height);
                    }
                }
                }
                translate([0,0,pin_height+wall_thickness]) {  // Move the drilling sphere and cylinder up
                    scale([1, 0.6, 1]) { // squash the sphere height if desired
                    #cylinder(d=cylinder_diameter, h=cylinder_height+1);
                        }
                    }
                }
            }

sampleholder(50, 10);