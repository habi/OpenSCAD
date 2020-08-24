$fn=100;
difference(){
    // Heart
    minkowski(){
        union(){
            hull(){
                translate([0,-6,0]) scale([0.618, 1, 1]) sphere(d=14);
                translate([0,0,-15]) sphere(d=1);
                }
            hull(){
                translate([0,6,0]) scale([0.618, 1, 1]) sphere(d=14);
                translate([0,0,-15]) sphere(d=1);
                }
            }
        cube([3,3,3], center=true);
    }
    // Text
    translate([-10,0,-1])
        rotate([90,0,90])
            linear_extrude(20) text("N + H",
                                    size = 7,
                                    halign="center",
                                    valign="center");
}
// Pedestal
translate([0,0,-17]) cylinder(d=5, h=5, center=true);
translate([0,0,-20]) cube([15, 25, 2.5], center=true);