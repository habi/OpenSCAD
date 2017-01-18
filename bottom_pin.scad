$fn=100;

module pin(diameter=6.2,height=10)
{
    difference(){
        cylinder(d=diameter,h=height);
        cylinder(d=diameter-2,h=height-1);
    }
}

pin();