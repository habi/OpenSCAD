$fn=100;
pin_height=10;
bottom_radius = 4;
bottom_height = 50;
taper_height=7;
top_radius = 8; // radius of the head part
top_height = 13;

module thing(scalefactor=1) {
            union() { // collect all parts, scale them and use this as "drill"
            scale([scalefactor, scalefactor, 1]){
                cylinder(r=bottom_radius,h=bottom_height); // cylinder for spine
                translate([0,0,bottom_height]) {
                    hull(){ // taper
                        cylinder(r=bottom_radius,h=0.01); // bottom connector of taper
                        translate([0,((bottom_radius+top_radius)*0.5)/scalefactor, taper_height]) cylinder(r=top_radius,h=0.01); // top connector of taper
                        translate([0, 0, taper_height]) cylinder(r=bottom_radius,h=0.01); // top connector of taper
                        }
                        hull(){
                            translate([0,((bottom_radius+top_radius)*0.5)/scalefactor,taper_height]) cylinder(r=top_radius,h=top_height); // cylinder for head
                            translate([0,0,taper_height]) cylinder(r=bottom_radius,h=top_height); // continuation of bottom cylinder
                        }
                    }                
            }
        }
    }

cylinder(d=6.15,h=pin_height); // bottom pin
translate([0,0,pin_height]) cylinder(r=bottom_radius, h=1); // close the bottom of the bottom cylinder. needed if 'bottom_radius + "wall thickness' are bigger than the diameter of the bottom pin.'
translate([0,0,pin_height]){ // shift everything else above the bottom pin
    difference() { // use this 'difference' as "drill"
        thing();
        thing(scalefactor=0.75);
    }
}