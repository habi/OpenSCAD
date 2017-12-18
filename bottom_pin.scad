$fn=100;

module pin(diameter=6.2, height=10, cap_depth=1)
{
    translate([0,0,-height]) difference(){
        cylinder(d=diameter,h=height);
        cylinder(d=diameter-1.5,h=height-cap_depth);
    }
}

pin();
