$fn=100;
pin_height=10;
bottom_radius = 3.5;
bottom_height = 50;
taper_height=7;
top_radius = 6;
top_height = 13;

module thing(scalefactor=1) {
            union() { // collect all parts, scale them and use this as "drill"
            scale([scalefactor, scalefactor, 1]){
                cylinder(r=bottom_radius,h=bottom_height); // cylinder for spine
                translate([0,0,bottom_height]) {
                    hull(){ // taper
                        cylinder(r=bottom_radius,h=0.01); // bottom connector of taper
                        translate([0,(top_radius/2)/scalefactor,taper_height]) cylinder(r=top_radius,h=0.01); // top connector of taper
                        }
                        translate([0,(top_radius/2)/scalefactor,taper_height]) cylinder(r=top_radius,h=top_height); // cylinder for head
                    }                
            }
        }
    }

cylinder(d=6.15,h=pin_height); // bottom pin
translate([0,0,pin_height]){ // shift everything else above the bottom pin
    difference() { // use this 'difference' as "drill"
        thing();
        thing(scalefactor=0.8);
    }
}