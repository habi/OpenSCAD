$fn=100;
bottom_pin_diameter = 6.25;

module sampleholder(cylinder_height,
                    cylinder_diameter,
                    wall_thickness=1,
                    pin_height=20,
                    squash_diameter=1,
                    squash_sphere=1) {
    // We use some "fancy" trigonometry to calculate the position of the sphere on top of the pin, namely:
    //  - The radius of the pin gives us the angle where we connect.
    //  - We thus scale it to the sphere radius (cyl_diam), and take the inverse sin.
    //  - The cosine of this angle gives us the distance we have to nudge the sphere down to make it flush with the cylinder
    sphere_center=pin_height+squash_sphere*0.5*(cylinder_diameter+wall_thickness-cylinder_diameter*(1-cos(asin(6.25/cylinder_diameter))));
    difference() { // Cut out cylinder and sphere with given diameter from cylinder and sphere with given diameter plus wall thickness
        union() { // Collect the bottom pin, the sphere and the cylinder
            cylinder(d=6.25, h=pin_height); // Bottom pin
            translate([0,0,sphere_center]) { // Move the sphere and cylinder up
                scale([1, squash_diameter, 1]) { // make the sphere and cylinder elliptic if desired
                    difference() { // Cut off the top half of the sphere with a cube
                        scale([1, 1, squash_sphere]) { // squash the sphere height if desired
                            sphere(d=cylinder_diameter+wall_thickness);
                        }
                        translate([-0.5*(cylinder_diameter+wall_thickness),
                                   -0.5*(cylinder_diameter+wall_thickness),
                                   0]) {
                            cube([cylinder_diameter+wall_thickness,
                                  cylinder_diameter+wall_thickness,
                                  0.5*(cylinder_diameter*squash_sphere)+wall_thickness]);
                            }
                        }
                    cylinder(d=cylinder_diameter+wall_thickness,
                             h=cylinder_height);
                    }
                }
            }
            translate([0,0,sphere_center]) {  // Move the drilling sphere and cylinder up
                union() { // Collect the drilling sphere and cylinder
                    scale([1, squash_diameter, 1]) {
                        scale([1, 1, squash_sphere]) { // squash the sphere height if desired
                            #sphere(d=cylinder_diameter);
                        }
                        #cylinder(d=cylinder_diameter, h=cylinder_height+1);
                    }
                }
            }
        }
    }
        

translate([ 0, 0, 0]) sampleholder(20, 12);
translate([12, 0, 0]) sampleholder(4, 8);
translate([25, 0, 0]) sampleholder(4, 10);