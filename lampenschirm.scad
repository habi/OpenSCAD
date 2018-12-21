// Üse Lampeschirm isch kabutt gange
//$fn=100;

hoehe = 15;
durchmesser_unten = 10;
durchmesser_oben = 25;
wanddicke = 1;

module random_beam(diameter=1){
    translate([0,0,-wanddicke])
    rotate([rands(30,180-30,1)[0],rands(30,180-30,1)[0],rands(0,180,1)[0]])
    cylinder(h = 35, d = diameter, center=true);
            }
            
difference(){
    difference(){
        cylinder(h = hoehe, d1 = durchmesser_unten, d2 = durchmesser_oben, center=true);
        translate([0,0,wanddicke/2]) cylinder(h = hoehe, d1 = durchmesser_unten, d2 = durchmesser_oben, center=true);
        }
        // Cutout Schraubgewinde
        translate([0,0,(wanddicke-hoehe/2)])
        #cylinder(h = 2 * wanddicke, d = 7.5, center=true);
        // Löcher in den Lampenschirm
        for(i=[0:50]) {#random_beam();}
        // Cutout zur Ansicht der Lampenschirm-Dicke
        translate([0,0,-(hoehe+1)/2]) #cube([hoehe+1, hoehe+1,hoehe+1]);
}