$fn=100;
thickness = 3;
length=24;

for (val=[[0,"HAPPY"],[120,"BIRTHDAY"],[240,"LAURA"]]) {
    rotate([0,val[0],0]) {
        translate([0,0,length*0.22604166666666666666666666666667]) {
            rotate([0,90,0]) translate([-thickness/2,0,0]) cylinder(d=thickness/2, h=length, center=true);
            translate([length/2,0,thickness/2]) sphere(d=thickness, center=true);
            difference(){
                linear_extrude(thickness) text(val[1], size = 3, halign="center", valign="center");
                #rotate([0,90,0]) translate([-thickness/2,0,0]) cylinder (d=thickness/1.618, h=20, center=true);
            }
        }
    }
}