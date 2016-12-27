// Go to https://www.thingiverse.com/thing:22477 and download the GoPro connector file and put it in the same folder as this file
use<GoPro_Connection.scad>
translate([10,1,0]) rotate([270,0,90]) GoPro_Connection();

wall_thickness=2;
width = 18;
length = 50;

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
//walls
wall_height=5;
rotate([90,00,0]) cube([length,wall_height,wall_thickness]);
translate([0, width+wall_thickness, 0]) rotate([90,0,0]) cube([length,wall_height,wall_thickness]);
//lips
lip_thickness=1.2;
lip_depth=2;
shift=3;
translate([0,0,shift]) cube([length,lip_depth,lip_thickness]);
translate([0,width-wall_thickness,shift]) cube([length,lip_depth,lip_thickness]);