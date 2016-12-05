 $fn = 100;
//Seine Maße nach dem Zusammenbau lauten 79 x 49 x 46 cm. 
%cube([46,49,79]);
cube([5,49,10]);
translate([0, 5, 0]) rotate([60,0,0]) cube([5,90,10]);
translate([46, 23, 0]) rotate([0,0,90]) cube([2,46,10]);
translate([46, 0, 0]) {
    cube([5,49,10]);
    translate([0, 5, 0]) rotate([60,0,0]) cube([5,90,10]);
}
translate([2.5, 2.5, 33]) cube([46,33,2]);
translate([2.5, 20, 57]) cube([46,21,2]);
translate([2.5, 5, 10]) rotate([0, 90, 0]) cylinder(h=46, d=2);

translate([2.5+23, 2.5+36, 75])
difference() {
    rotate_extrude(angle=180, convexity = 10) translate([23, 0, 0]) scale([1,3,1]) circle(r = 1, $fn = 100, center=true);
    # translate([0,-25,0]) cube([50,50,10], center=true);
}

translate([2.5+23, 2.5+31, 65])
difference() {
    rotate_extrude(angle=180, convexity = 10) translate([23, 0, 0]) scale([1,3,1]) circle(r = 1, center=true);
    # translate([0,-25,0]) cube([50,50,10], center=true);
}
