// For a comment on https://www.reddit.com/r/Damnthatsinteresting/comments/cpp8mb/so_thats_how_you_do_it/
$fn=100;

sphere(10.5);
translate([10,10,0]) cube([2,2,22], center=true);
translate([-10,10,0]) cube([2,2,22], center=true);
translate([-10,-10,0]) cube([2,2,22], center=true);
translate([10,-10,0]) cube([2,2,22], center=true);

rotate([90,0,0]) translate([10,10,0]) cube([2,2,22], center=true);
rotate([90,0,0]) translate([-10,10,0]) cube([2,2,22], center=true);
rotate([90,0,0]) translate([-10,-10,0]) cube([2,2,22], center=true);
rotate([90,0,0]) translate([10,-10,0]) cube([2,2,22], center=true);

rotate([0,90,0]) translate([10,10,0]) cube([2,2,22], center=true);
rotate([0,90,0]) translate([-10,10,0]) cube([2,2,22], center=true);
rotate([0,90,0]) translate([-10,-10,0]) cube([2,2,22], center=true);
rotate([0,90,0]) translate([10,-10,0]) cube([2,2,22], center=true);