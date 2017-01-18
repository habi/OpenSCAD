$fn=100;

module pin(diameter=6.2,height=10)
{
    difference(){
        cylinder(d=6.2, h=height);
            cylinder(d=4, h=height);
    }
}

pin();