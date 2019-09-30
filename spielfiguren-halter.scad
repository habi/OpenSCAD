//Halter für Spielfiguren und Würfel

$fs=0.1;

diameter = 13.5;
height = 17;
cubewidth = 17;
scalefactor = 1.2;

difference(){
    translate([0,0,-4]) cube([4 * scalefactor * diameter,4 * scalefactor * diameter + 3 * cubewidth, 15], center=true);
    for (x = [-1:2]){
        for (y = [-1:2]){
            translate([x * scalefactor * diameter - scalefactor * 0.5 * diameter, y * scalefactor * diameter - scalefactor * 0.5 * diameter, 0])
            # cylinder(d=diameter,h=height, center=true);
            }
        }
    for (x = [0:1]){
        for (y = [-1,1]){
        translate([x * scalefactor * cubewidth - 0.5 * cubewidth, (2 * diameter + cubewidth) * y, 0])
        # cube(cubewidth, center=true);
        }
    }
}