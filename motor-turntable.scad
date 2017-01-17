$fn=100;

//baseplate
difference(){
    for (angle = [0:60:359])
        rotate([0,0,angle]) cube([20,8,2]);
    cylinder(d=7, h=5);
}
//motor holder
difference(){
    cylinder(d=27, h=7);
    cylinder(d=25, h=7);
    translate([sqrt(25-3)*2,sqrt(25-3)*2,2]) #cylinder(d=3,h=3);
}
//rotation blocker
translate([17,0,5]) cube([2,30,10], center=true);


translate([0,0,12]){
    // turntable
    for (angle = [0:30:359])
        rotate([0,0,angle]) cube([30,2,2]);
    for (y = [20:10:60])
        difference(){
            cylinder(d=y+1, h=2);
            cylinder(d=y-1, h=2);
        }
    //shaft
    translate([0,0,1]) {
        difference(){
            cylinder(d=8, h=5);
            cylinder(d=6, h=5);
        }        
    }
}
