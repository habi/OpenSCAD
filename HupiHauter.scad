// Hupe-ans-LIKEaBike-MontierDings

$fn=100;

width=25;
length=30;
oringdiameter=0.5;
ropediameter = 2;
squash = 1.4;

module hupirohr(){
    // Rohr
    rohrdurchmesser=13.1;
    #cylinder(d=rohrdurchmesser,h=50, center=true);
    // Nut für O-Ringe
    #translate([0,0,5]) rotate_extrude() translate([rohrdurchmesser/2, 0, 0]) circle(r = oringdiameter);    
    #translate([0,0,-5]) rotate_extrude() translate([rohrdurchmesser/2, 0, 0]) circle(r = oringdiameter);
    }

module schnur(){
    // Nut fürs anbinden
    diameter=16;
    angle=35;
    translate([0,3,0]){
        #rotate([0,angle,0]) translate([0,0,0]) rotate_extrude() translate([diameter, 0, 0]) circle(r = ropediameter);
        #rotate([0,-angle,0]) translate([0,0,0]) rotate_extrude() translate([diameter, 0, 0]) circle(r = ropediameter);
        }
    }

// Flache Seite am Lenker
difference(){
    translate([0,width/4,0]) cube([width*1.4,width/2,length], center=true);
    scale([squash,1,1]) schnur();
    hupirohr();
}

// Andere Seite
translate([width*0,-5,0]){ // Chli verschieben, damits gäbig geht mit drucken
    difference(){
        scale([squash,1,1]) cylinder(d=width,h=length, center=true);
        scale([squash,25,1]) schnur();
        hupirohr();
        // Untere Hälfte wegschneiden
        scale([squash,1,1]) # translate([0,width/4,0]) cube([width+3,width/2,length], center=true);
        }
    }