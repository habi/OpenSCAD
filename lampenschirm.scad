// Üse Lampeschirm isch kabutt gange
$fn=100;

// Follow the README in https://github.com/brodykenrick/text_on_OpenSCAD
// to write on the cylinders
use <text_on_OpenSCAD/text_on.scad>

hoehe = 50;
durchmesser_unten = 63;
durchmesser_oben = 100;
wanddicke = 4;
textrotation = -25;
textsize = 7;
extrusion_height = wanddicke*.618;

module random_beam(diameter=wanddicke/2){
    translate([0,0,-wanddicke])
    rotate([rands(30,180-30,1)[0], rands(30,180-30,1)[0], rands(0,180,1)[0]])
    cylinder(h = durchmesser_oben*1.5, d = diameter, center=true);
        }
        
difference(){
    //difference(){
    cylinder(h = hoehe, d1 = durchmesser_unten, d2 = durchmesser_oben, center=true);
    union(){
        translate([0,0,wanddicke/2]) cylinder(h = hoehe, d1 = durchmesser_unten-wanddicke, d2 = durchmesser_oben-wanddicke, center=true);
        for (i = [0:45:360-45]){
            text_on_cylinder("Päppu",r1=(durchmesser_unten-wanddicke)/2,r2=(durchmesser_oben-wanddicke)/2,h=hoehe,rotate=textrotation,eastwest=0+i,cylinder_center=true, size=textsize, updown=-3*textsize*.618,extrusion_height=extrusion_height);
            text_on_cylinder("Mama",r1=(durchmesser_unten-wanddicke)/2,r2=(durchmesser_oben-wanddicke)/2,h=hoehe,rotate=textrotation,eastwest=5+i,cylinder_center=true, size=textsize, updown=-textsize*.618,extrusion_height=extrusion_height);
           text_on_cylinder("Aline",r1=(durchmesser_unten-wanddicke)/2,r2=(durchmesser_oben-wanddicke)/2,h=hoehe,rotate=textrotation,eastwest=10+i,cylinder_center=true, size=textsize, updown=textsize*.618, extrusion_height=extrusion_height);
        text_on_cylinder("Elio",r1=(durchmesser_unten-wanddicke)/2,r2=(durchmesser_oben-wanddicke)/2,h=hoehe,rotate=textrotation,eastwest=15+i,cylinder_center=true, size=textsize, updown=3*textsize*.618,extrusion_height=extrusion_height);
        }
    }
        // Cutout Schraubgewinde
        translate([0,0,(wanddicke-hoehe/2)])
        #cylinder(h = 2 * wanddicke, d = 46, center=true);
        // Löcher in den Lampenschirm
        //for(i=[0:10]) {
            //#random_beam();
            //}
        // Cutout zur Ansicht der Lampenschirm-Dicke
      //translate([0,0,-(hoehe+1)/2]) #cube([durchmesser_oben/2+1, durchmesser_oben/2+1, hoehe+1]);
    //}
}