$fn=100;
diameter = 60;
height= 40;
dice_lenght = 19;
wall_thickness=4;

// card holder
difference(){
    // box
    cube([diameter+wall_thickness,diameter+wall_thickness,height+wall_thickness],center=true);
    // hole
    union(){
        #cylinder(d=diameter, h=height, center=true);
        #translate([0.5*diameter,0,0]) cube([diameter,diameter,height],center=true);
    }
}
// cover
shrink=2;
translate([0,0,2*wall_thickness+height]) {
    difference(){
        // actual cover
        union(){
            // "stamp"
            translate([0.5*diameter,0,0]) cube([0.8*(diameter-shrink),diameter-shrink,height],center=true);
            // rim
            #translate([0.5*(diameter+wall_thickness),-0.5*(diameter+wall_thickness),-0.5*(height+wall_thickness)]) cube([0.5*(diameter)-2*wall_thickness,diameter+wall_thickness,height+wall_thickness]);    
            }
        // cards
        cylinder(d=diameter, h=height, center=true);
        // dice hole
        rotate([0,0,22.5]) translate([0.4*(diameter+dice_lenght),0,0]) cube([2*dice_lenght,dice_lenght,dice_lenght],center=true);
    }
}