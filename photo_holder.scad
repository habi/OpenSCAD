// Holder to put a photo on the desk
$fn=100;

difference() {
    dome();
    # rotate([0,12,0]) translate([90, 0, 7]) #slit();
}

module slit (slitwidth=1.5) {
    difference(){
        cylinder(h=9.9,d=200+slitwidth, center=true);
        cylinder(h=10,d=200, center=true);        
    }
}

module dome () {
    difference() {
        difference() {
            scale([0.618,1,0.618]) sphere(d=50);            
            translate([0,0,-9]) scale([0.618,1,0.618]) sphere(d=50);
        }
        #translate([0,0,-10]) cube([50,50,20], center=true);
    }
}