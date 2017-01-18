use <bottom_pin.scad>;
height=8;
//bottom pin
pin(height=height);

//box on top for the wood samples
difference(){
    translate([0,0,height+3.5]) cube([7,7,7], center=true);
    #translate([0,0,height+4]) cube([5,5,8], center=true);
}
