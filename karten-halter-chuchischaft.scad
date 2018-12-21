$fn=100;
breite = 15;
tiefe=37;
hoehe=25;

module halter() {
    griffdurchmesser = 12;
    difference(){
        hull(){
            //Mitte
            cube([breite-5, 1, 1], center=true);
            translate([0,25,0]) cube([breite, 1, 1], center=true);
            // Oben und unten
            for (h=[hoehe,-hoehe])
                translate([0,0,h]) sphere(d=1, center=true);
            // Spitze
            translate([0,tiefe,0]) sphere(d=1, center=true);
            }
        // Griff-Loch
        for (h =[-3:7])
            translate([0,griffdurchmesser/2-1+20,-griffdurchmesser/2-h])
                rotate([0,90,0])
                    #cylinder(d=griffdurchmesser, h=breite+1, center=true);
        // Karten-Slot
        translate([0,12,12]) 
            rotate([5,0,10])
                #cube([breite+3,2,15], center=true);
        // Material sparen
        for (h =[-9:4])
            translate([0,18-0.5,h])
                rotate([90,0,0])
                    #cylinder(d=5, h=18);
    }
}

//links
halter();
//rechts
mirror([1,0,0]) translate([breite+1,0,0]) halter();