// The seat cusion in our [cargo bike](https://www.r-m.de/de/modelle/packster-60/) isn't sticking to the base board anymore.
// Let's thus print a stopper preventing it from sliding around.

$fn=10;

// insert for slot in base board
slot_diameter=10;
slot_width=50;
height=20;
hull(){
    translate([0,-slot_width/2,0]) cylinder(d=slot_diameter, h=height, center=true);
    translate([0,slot_width/2,0]) cylinder(d=slot_diameter, h=height, center=true);
}


// cushion stopper
stopper_width=150;
distance=45;
hull(){
    translate([distance,-stopper_width/2,height]) cylinder(d=slot_diameter, h=20, center=true);
    translate([distance,stopper_width/2,height]) cylinder(d=slot_diameter, h=20, center=true);
}


// connector "rods"
hull(){
    translate([distance,0,height]) cube([slot_diameter, slot_diameter, height], center=true);
    //connector blob
    translate([0,0,height/2]) difference(){
        sphere(d=slot_diameter, center=true);
        translate([0,0,-slot_diameter*0.5]) cube([10,10,slot_diameter], center=true);
    }
}
hull(){
    translate([distance,-stopper_width/2,height]) cylinder(d=slot_diameter, h=20, center=true);
    //connector blob
    translate([0,-slot_width/2,height/2]) difference(){
        sphere(d=slot_diameter, center=true);
        translate([0,0,-slot_diameter*0.5]) cube([10,10,slot_diameter], center=true);
    }
}
hull(){
    translate([distance,stopper_width/2,height]) cylinder(d=slot_diameter, h=20, center=true);
    //connector blob
    translate([0,slot_width/2,height/2]) difference(){
        sphere(d=slot_diameter, center=true);
        translate([0,0,-slot_diameter*0.5]) cube([10,10,slot_diameter], center=true);
    }
}