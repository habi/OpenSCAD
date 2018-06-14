$fn=50;
breite = 15;
tiefe=35;
hoehe=25;

module halter() {
    griffdurchmesser = 12;
    difference(){
        hull(){
            //Mitte
            cube([5, 1, 1], center=true);
            // Oben und unten
            for (h=[hoehe,-hoehe])
                translate([0,0,h]) sphere(d=1, center=true);
            // Spitze
            translate([0,tiefe,0]) sphere(d=5, center=true);
            }
        // Griff-Loch
        for (h =[-3:7])
            translate([0,griffdurchmesser/2-0.5+18,-griffdurchmesser/2-h])
                rotate([0,90,0])
                    #cylinder(d=griffdurchmesser, h=breite, center=true);
        // Karten-Slot
        translate([0,12,15]) 
            rotate([5,0,10])
                #cube([breite+3,2,15], center=true);
        // Material sparen
        for (h =[-10:3])
            translate([0,15-0.5,h])
                rotate([90,0,0])
                    #cylinder(d=6, h=15);
    }
}

//links
halter();
//rechts
//mirror([0,0,1]) translate([0,0,5]) halter();