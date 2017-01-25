// Download the GoPro connector file at http://www.thingiverse.com/thing:62800/zip and put ../files/gopro_mounts_mooncactus.scad in the same folder as this file
use <gopro_mounts_mooncactus.scad>
 
wall_thickness=2;
width = 18.5;
length = 42;
//temporary cutaways
difference() {
    union(){
        // gopro
        xshift=0;
        yshift=width/2;
        zshift=1;
        translate([xshift+7,yshift,-zshift-10.5]) rotate([90,0,0]) gopro_connector("triple");
        // taper from the connector to the base plate
        hull() {
            // goproconnector plate receiver
            translate([xshift+7-7.35,yshift-7.35,-zshift-10.5+10.75]) cube([14.75,14.75,0.5]);
            // base plate receiver
            translate([-wall_thickness,-wall_thickness,0]) cube([length+wall_thickness,width+2*wall_thickness,0.5]);
        }
        // base plate
        difference(){
            cube([length,width,wall_thickness]);
            // notch for latch
            latch_width = 6;
            hole_depth = 1;
            from_end=7;
            notch_length=2.5;
            #translate([length-from_end,(width/2)-(latch_width/2),wall_thickness-hole_depth]) cube([notch_length,latch_width,2*hole_depth]);
        }
        // side walls
        wall_height=9;
        rotate([90,00,0]) cube([length,wall_height,wall_thickness]);
        translate([0, width+wall_thickness, 0]) rotate([90,0,0]) cube([length,wall_height,wall_thickness]);
        // lips
        lip_thickness=2.0;
        lip_depth=2.0;
        shift=2.7;
        translate([0,0,wall_thickness+shift]) cube([length,lip_depth,lip_thickness]);
        translate([0,width-wall_thickness,wall_thickness+shift]) cube([length,lip_depth,lip_thickness]);
        // front wall
        translate([-wall_thickness,-wall_thickness,0]) cube([wall_thickness,width+2*wall_thickness,wall_height]);
    }
    translate([0,0,-12]) cube([100,50,25], center=true);
    #translate([19,-5,4]) cube([27,22,15], center=true);
    #translate([19,23,4]) cube([27,22,15], center=true);
}