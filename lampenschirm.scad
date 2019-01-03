// Üse Lampeschirm isch kabutt gange
$fn=100;

hoehe = 15;
durchmesser_unten = 60;
durchmesser_oben = 80;
wanddicke = 5;

module random_beam(diameter=wanddicke/2){
    translate([0,0,-wanddicke])
    rotate([rands(30,180-30,1)[0],rands(30,180-30,1)[0],rands(0,180,1)[0]])
    cylinder(h = durchmesser_oben*1.5, d = diameter, center=true);
            }
            
difference(){
    difference(){
        cylinder(h = hoehe, d1 = durchmesser_unten, d2 = durchmesser_oben, center=true);
        translate([0,0,wanddicke/2]) cylinder(h = hoehe, d1 = durchmesser_unten, d2 = durchmesser_oben, center=true);
        }
        // Cutout Schraubgewinde
        translate([0,0,(wanddicke-hoehe/2)])
        #cylinder(h = 2 * wanddicke, d = 45, center=true);
        // Löcher in den Lampenschirm
        for(i=[0:25]) {#random_beam();}
        // Cutout zur Ansicht der Lampenschirm-Dicke
        //translate([0,0,-(hoehe+1)/2]) #cube([hoehe+1, hoehe+1,hoehe+1]);
}