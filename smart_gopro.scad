// Download the GoPro connector file at http://www.thingiverse.com/thing:62800/zip and put ../files/gopro_mounts_mooncactus.scad in the same folder as this file
use <gopro_mounts_mooncactus.scad>

$fn=100; 
wall_thickness=3;
width = 18.5;
length = 42;
wall_height=9;

module taper(tpd=10, tpl=18) {
    scale([1.25,1,1]) {
        difference(){
            cube([tpd,tpd,tpl], center=true);
            cylinder(d=tpd, h=tpl, center=true);
            translate([0,-tpd/2,0]) cube([tpd,tpd,tpl], center=true);
            translate([tpd/2,0,0]) cube([tpd,tpd,tpl], center=true);
            }
        }
    }

difference() { // (temporary) cutaways
    union(){
        // gopro connector
        xshift=0;
        yshift=width/2;
        zshift=1;
        translate([xshift+7,yshift,-zshift-12]) rotate([90,0,0]) gopro_connector("triple");
        translate([xshift+20.5,yshift,-zshift-6.5]) rotate([90,0,0]) taper(tpl=14.75);
        translate([xshift-0.5,yshift,-zshift-2.5]) rotate([90,75,0]) cube([3,0.5,14.75], center=true);
        translate([xshift+14.75/2,yshift-7.5,-zshift-2.5]) rotate([90,75,90]) cube([3,0.5,14.75], center=true);
        translate([xshift+14.75/2,yshift+7.5,-zshift-2.5]) rotate([90,-75,90]) cube([3,0.5,14.75], center=true);        
        // taper from the connector to the base plate
        hull() {
            // connector receiver
            translate([xshift+7-7.35,yshift-7.35,-zshift-10.5+8]) cube([14.75,14.75,0.5]);
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
        rotate([90,00,0]) cube([length,wall_height,wall_thickness]);
        translate([0, width+wall_thickness, 0]) rotate([90,0,0]) cube([length,wall_height,wall_thickness]);
        // lips
        lip_thickness=1.5;
        lip_depth=2;
        shift=3.2;
        translate([0,0,wall_thickness+shift]) cube([length-4,lip_depth,lip_thickness]);
        translate([0,width-lip_depth,wall_thickness+shift]) cube([length-4,lip_depth,lip_thickness]);
        // front wall
        translate([-wall_thickness,-wall_thickness,0]) cube([wall_thickness,width+2*wall_thickness,wall_height]);
    }
    //temporarily save some material
    //#translate([-wall_thickness,-wall_thickness,-25]) cube([length+wall_thickness,width+2*wall_thickness,25]);
    //#translate([19,-5,4]) cube([27,22,15], center=true);
    //#translate([19,23,4]) cube([27,22,15], center=true);
    // Add some text, for fun
    #rotate([-90, 0, 90]) translate([width/2, -wall_height/2, wall_thickness-1])  linear_extrude(1.5) text("Achtung!", size = 3, halign="center", valign="center");
    #translate([length-12, width/2, 1.25]) rotate([180+7, 0, -90]) linear_extrude(3) text("Faaahre!", size = 3, halign="center", valign="center");
    #translate([length-19, width/2, 0.5]) rotate([180+7, 0, -90]) linear_extrude(3) text("\u263A", size = 10, halign="center", valign="center");    
}