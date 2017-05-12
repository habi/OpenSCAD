use <bottom_pin.scad>;

//bottom pin
pin(height=15);
//box on top for the wood samples
inner= 5;
wall = 1.5;
cubeheight = 10;
difference(){
    translate([0,0,cubeheight/2-wall]) cube([inner+wall,inner+wall,cubeheight], center=true);
    #translate([0,0,cubeheight/2]) cube([inner,inner,cubeheight+wall+wall], center=true);
}