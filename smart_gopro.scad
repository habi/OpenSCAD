// Download the GoPro connector file at http://www.thingiverse.com/thing:62800/zip and put ../files/gopro_mounts_mooncactus.scad in the same folder as this file
use <gopro_mounts_mooncactus.scad>
 
translate([9,9.5,-14]) rotate([90,0,0]) gopro_connector("triple");

wall_thickness=2;
width = 18;
length = 50;

// taper from the connector to the base plate
hull() {
    // goproconnector plate receiver
    translate([1.5,2,-4]) cube([15,15,0.5]);
    // base plate receiver
    cube([30,width,0.5]);
}
// base plate
difference(){
    cube([length,width,wall_thickness]);
    // notch for latch
    latch_width = 3;
    hole_depth = 1;
    from_end=8;
    notch_length=3;
    #translate([length-from_end,(width/2)-(latch_width/2),wall_thickness-hole_depth]) cube([notch_length,latch_width,2*hole_depth]);
}
// holder walls
wall_height=5;
rotate([90,00,0]) cube([length,wall_height,wall_thickness]);
translate([0, width+wall_thickness, 0]) rotate([90,0,0]) cube([length,wall_height,wall_thickness]);
// lips
lip_thickness=1.2;
lip_depth=2;
shift=3;
translate([0,0,shift]) cube([length,lip_depth,lip_thickness]);
translate([0,width-wall_thickness,shift]) cube([length,lip_depth,lip_thickness]);