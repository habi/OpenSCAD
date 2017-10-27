// Hupe-ans-LIKEaBike-MontierDings

$fn=25;

width=25;
oringdiameter=0.5;
ropediameter = 2.5;

module hupirohr(){
    // Rohr
    #cylinder(d=15,h=40, center=true);
    // Nut für O-Ringe
    #translate([0,0,5]) rotate_extrude() translate([15/2, 0, 0]) circle(r = oringdiameter);    
    #translate([0,0,-5]) rotate_extrude() translate([15/2, 0, 0]) circle(r = oringdiameter);
    }

module schnur(){
    // Nut fürs anbinden
    diameter=17;
    translate([0,3,0]){
        #rotate([0,45,0]) translate([0,0,0]) rotate_extrude() translate([diameter, 0, 0]) circle(r = ropediameter);
        #rotate([0,-45,0]) translate([0,0,0]) rotate_extrude() translate([diameter, 0, 0]) circle(r = ropediameter);
        }
    }

// Flache Seite am Lenker
difference(){
    translate([0,width/4,0]) cube([width+3,width/2,30], center=true);
    schnur();
    hupirohr();
}

// Andere Seite
translate([width*0,-5,0]){ // Chli verschieben, damits gäbig geht mit drucken
    difference(){
        cylinder(d=width,h=30, center=true);
        schnur();
        hupirohr();
        // Untere Hälfte wegschneiden
        # translate([0,width/4,0]) cube([width+3,width/2,30], center=true);
        }
    }