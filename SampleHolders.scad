use <text_on.scad>

$fn=100;
bottom_pin_diameter = 6.25;
height = 10;
sphereradius = bottom_pin_diameter;
overscan = 1.1;

module sampleholder(cylinder_height,
                    cylinder_diameter,
                    wall_thickness=1,
                    pin_height=10,
                    squash_diameter=1,
                    squash_sphere=0.25) {
    // We use some "fancy" trigonometry to calculate the position of the sphere on top of the pin, namely:
    //  - The radius of the pin gives us the angle where we connect.
    //  - We thus scale it to the sphere radius (cyl_diam), and take the inverse sin.
    //  - The cosine of this angle gives us the distance we have to nudge the sphere down to make it flush with the cylinder
    sphere_center=pin_height+squash_sphere*0.5*(cylinder_diameter-cylinder_diameter*(1-cos(asin(6.25/cylinder_diameter))));                                             
    union() { // We want to create one piece
        difference () { // From the bottom pin and sphere we cut away at the maximum diameter of the sphere, where we'll connect the cylinder on top
            union() {
                    // Bottom pin                
                    cylinder(d=6.25, h=pin_height);
                    // 
                // Connecting sphere
                translate([0,0,sphere_center])            
                    scale([1, squash_diameter, squash_sphere])        
                    sphere(d=cylinder_diameter);
                }
            // Cutoff
            translate([-0.5*cylinder_diameter,-0.5*cylinder_diameter,sphere_center])
                cube([cylinder_diameter,cylinder_diameter,0.5*cylinder_diameter*squash_sphere]);
            translate([0,0,sphere_center])
                scale([1, squash_diameter, squash_sphere])
                sphere(d=cylinder_diameter-wall_thickness,center=true);
            }
        translate([0,0,sphere_center])
            difference() {
                scale([1, squash_diameter, 1])
                    cylinder(d=cylinder_diameter, h=cylinder_height);
                scale([1, squash_diameter, 1])
                    cylinder(d=cylinder_diameter-wall_thickness, h=cylinder_height);
            }
        }
    }

sampleholder(15, 10, squash_diameter=0.618);
translate([15, 0, 0]) sampleholder(15, 10, wall_thickness=0.5);
translate([30, 0, 0]) sampleholder(15, 10, wall_thickness=0.3);

translate([ 0, 20, 0]) sampleholder(15, 15);
translate([20, 20, 0]) sampleholder(15, 15, wall_thickness=0.5, squash_diameter=0.618);
translate([40, 20, 0]) sampleholder(15, 15, wall_thickness=0.3);    

translate([ 0, 45, 0]) sampleholder(20, 20);
translate([25, 45, 0]) sampleholder(20, 20, wall_thickness=0.5);
translate([50, 45, 0]) sampleholder(20, 20, wall_thickness=0.3, squash_diameter=0.618);    