$fn=50;
breite = 15;
tiefe=43;
hoehe=46;

module halter() {
    difference(){
    // Hauptteil
    difference(){
        cube([tiefe,hoehe,breite]);
        #translate([tiefe, 0, 0]) cylinder(d=2*tiefe, h=breite);
        #cube([5,15,breite]);
        }
    // Griff-Loch
    # translate([25,(tiefe)*cos(30),0]) cylinder(d=12, h=breite+10);
    # translate([25-1,(tiefe)*cos(30),0]) cylinder(d=12, h=breite+10);
    // Karten-Slot
    #translate([12,hoehe-5,0]) rotate([0,5,10])cube([2,5,breite+3]);
    }
}
//links
halter();
//rechts
//mirror([0,0,1]) translate([0,0,5]) halter();