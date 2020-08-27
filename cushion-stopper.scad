// The seat cusion in our [cargo bike](https://www.r-m.de/de/modelle/packster-60/) isn't sticking to the base board anymore.
// Let's thus print a stopper preventing it from sliding around.

$fn=50;

// insert for slot in base board
slot_diameter=5;
slot_width=28;
height=7.5;
    hull(){
        translate([0,-(slot_width-slot_diameter)/2,-height]) cylinder(d=slot_diameter, h=height);
        translate([0,(slot_width-slot_diameter)/2,-height]) cylinder(d=slot_diameter, h=height);
    }
// cushion stopper
stopper_width=100;
distance=50;
difference(){
    hull(){
        translate([distance,-stopper_width/2,0]) cylinder(d=slot_diameter, h=20);
        translate([distance,stopper_width/2,0]) cylinder(d=slot_diameter, h=20);
    }
    for (i=[-4:4])
        translate([distance-5,-10*i,10]) rotate([0,90,0]) cylinder(d=5, h=10);
} 
    
// rods
for (i=[-1:1])
   translate([0,i*(slot_width-slot_diameter)/2,0]) {
       hull(){
           // front
           cylinder(d=slot_diameter, h=slot_diameter/2);
           // cushion
           translate([distance,5*i,5]) cylinder(d=slot_diameter, h=slot_diameter/2);
        }
    }
for (i=[-1:1])
   translate([0,i*(slot_width-slot_diameter)/2,0]) {
       hull(){
           // front
           cylinder(d=slot_diameter, h=slot_diameter/2);
           // cushion
           translate([distance,distance*i/2,15]) cylinder(d=slot_diameter, h=slot_diameter/2);
        }
    }  
// make it look a bit nicer
hull(){
    translate([0,-(slot_width-slot_diameter)/2,0]) cylinder(d=slot_diameter, h=slot_diameter/2);
    translate([0,(slot_width-slot_diameter)/2,0]) cylinder(d=slot_diameter, h=slot_diameter/2);
}