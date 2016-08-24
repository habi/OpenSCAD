$fn=100;
bottom_pin_diameter = 6.2;

module sampleholder(cylinder_height,
                    cylinder_diameter,
                    wall_thickness=0.5,
                    pin_height=20,
                    ) {
    difference() { // Cut out cylinder with given diameter from cylinder with given diameter plus wall thickness
        union() { // Collect the bottom pin and the cylinder
            cylinder(d=6.25, h=pin_height); // Bottom pin
            translate([0,0,pin_height]) { // Move the sphere and cylinder up
                    cylinder(d=cylinder_diameter+wall_thickness,h=cylinder_height);
                    }
            }
            translate([0,0,pin_height]) {  // Move the drilling sphere and cylinder up
                #cylinder(d=cylinder_diameter, h=cylinder_height+1);
                    }
                }
            }

        
for (x = [0:10: 30]) {
    for (y = [0:10:20]) {
        translate([x,y,0]) sampleholder(20, 4, wall_thickness=0.75);
        }
    for (y = 20) {
        translate([x,y,0]) sampleholder(20, 4, wall_thickness=1);
        }        
    for (y = 30) {
        translate([x,y,0]) sampleholder(20, 4, wall_thickness=1.25);
        }                
    }