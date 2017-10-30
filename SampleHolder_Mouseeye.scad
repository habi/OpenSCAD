$fn=100;
bottom_pin_diameter = 6.25;

module sampleholder(cylinder_height,
    cylinder_diameter,
    wall_thickness=1,
    pin_height=25) {
        difference() { // Cut out a cylinder and a sphere with the given diameter from a cylinder and a sphere with the given diameter plus the wall thickness
            union() { // Collect the bottom pin, the sphere and the cylinder
                cylinder(d=bottom_pin_diameter, h=pin_height); // Bottom pin
                hull() { // make a hull to connect the sphere nicely with the bottom pin
                    translate([0,0,pin_height-0.1]) cylinder(d=bottom_pin_diameter, h=0.1); // "Connector" for hull
                    translate([0,0,pin_height+0.5*cylinder_diameter]) sphere(d=cylinder_diameter+wall_thickness); // shpere for hull
                }
                translate([0,0,pin_height+0.5*cylinder_diameter]) { // Move the sphere and cylinder up
                    difference() { // Cut off the top half of the sphere with a cube
                        sphere(d=cylinder_diameter+wall_thickness);
                        #translate([-0.5*(cylinder_diameter+wall_thickness), -0.5*(cylinder_diameter+wall_thickness), 0]) {
                            cube([cylinder_diameter+wall_thickness, cylinder_diameter+wall_thickness, 0.5*(cylinder_diameter)+wall_thickness]);
                            }
                        }
                    cylinder(d=cylinder_diameter+wall_thickness, h=cylinder_height);
                    }
                }
            translate([0,0,pin_height+0.5*cylinder_diameter]) {  // Move the drilling sphere and cylinder up
                union() { // Collect the drilling sphere and cylinder
                    #sphere(d=cylinder_diameter);
                    #cylinder(d=cylinder_diameter, h=cylinder_height+1);
                }
            }
        }
    }

sampleholder(6, 4);