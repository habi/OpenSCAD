$fn=250;

// Fokus-Forcierer
difference(){
    union(){
        cylinder(d=65,h=18);
        cylinder(d=69,h=13);
    }
    union(){
        cylinder(d=59.2,h=17);
        cylinder(d=43.5,h=20);
    }
}

// Deckel
translate([0,0,25]){
    difference(){
    cylinder(d=69,h=18);
    cylinder(d=65.5, h=15);
    }
}