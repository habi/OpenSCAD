$fn=100;
diameter=50;
thickness=5;

difference(){
    sphere(d=diameter);
    #translate([2*thickness,2*thickness,diameter*.25]) union(){
         translate([-diameter*.25,0,0]) cube([diameter*.5,thickness,diameter*.5], center=true);
        #rotate([0,0,90]) translate([-diameter*.25,0,0]) cube([diameter*.5,thickness,diameter*.5], center=true);  
        translate([-.25*thickness,-.25*thickness,0]) cylinder(d=10, h=diameter*.5, center=true);
    }
}