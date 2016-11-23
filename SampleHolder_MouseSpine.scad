$fn=100;
scalefactor = 0.8;
bottom_radius = 3.5;
bottom_height = 50;
taper_height=7;
top_radius = 3.5;
top_height = 13;

cylinder(d=6.1,h=15); //bttom pin
translate([0,0,15]){ // shift everything else above the bottom pin
    difference() { // use this 'difference' as "drill"
        union(){ // collect all parts
            cylinder(r=bottom_radius,h=bottom_height); // cylinder for spine
            translate([0,0,bottom_height]) {
                hull(){ // taper
                    cylinder(r=3.5,h=0.01); // bottom connector of taper
                    translate([0,5,15]) cylinder(r=6,h=0.01); // top connector of taper
                    }
                    translate([0,5,15]) cylinder(r=6,h=13); // cylinder for head
                }
            }
        union() { // collect all parts, scale them and use this as "drill"
            scale([scalefactor, scalefactor, 1]){
                cylinder(r=bottom_radius,h=bottom_height); // cylinder for spine
                translate([0,0,bottom_height]) {
                    hull(){ // taper
                        cylinder(r=3.5,h=0.01); // bottom connector of taper
                        translate([0,5/scalefactor,15]) cylinder(r=6,h=0.01); // top connector of taper
                        }
                        translate([0,5/scalefactor,15]) cylinder(r=6,h=13); // cylinder for head
                    }                
            }
        }
    }
}