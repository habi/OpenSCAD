$fn=100;

use <gopro_mounts_mooncactus.scad>
hole_diameter=8;
module pin() {
    cylinder(d=4,h=20);
    difference(){
        cylinder(d=8,h=5);
        #rotate([90,0,0]) translate([0,6,-8]) cylinder(d=hole_diameter,h=15);

    }
    }

gopro_connector("triple");
difference(){
    translate([0,10,0]) rotate([-90,0,0]) cylinder(d=hole_diameter,h=15);
    #translate([10,20,0]) rotate([-90,0,90]) pin();
    }
    
translate([20,0,-10]) pin();
