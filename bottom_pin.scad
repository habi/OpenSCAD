$fn=100;

module pin(diameter=6.2, height=10, cap_depth=1)
{
    difference(){
        cylinder(d=diameter,h=height);
        cylinder(d=diameter-2,h=height-cap_depth);
    }
}

pin();