$fn=50;
breite = 15;
tiefe=50;
hoehe=60;

module halter() {
    difference(){
    // Hauptteil
    difference(){
        cube([tiefe,hoehe,breite]);
        #translate([tiefe, 0, 0]) cylinder(d=2*tiefe, h=breite);
        #cube([5,20,breite]);
        }
    // Griff-Loch
    # translate([30,(tiefe)*cos(30),0]) cylinder(d=12, h=breite+10);
    # translate([30-1,(tiefe)*cos(30),0]) cylinder(d=12, h=breite+10);
    // Karten-Slot
    #translate([10,hoehe-5,0]) rotate([0,5,5])cube([1,5,breite+3]);
    }
}
//links
halter();
//rechts
 mirror([0,0,1]) translate([0,0,5]) halter();