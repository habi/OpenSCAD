height=50;
outer_radius = 4;
inner_radius = 3;

for (x = [0:10:50], y=[0:10:50])
    translate([x,y,0])
    difference() {
        cylinder(r1=outer_radius, r2=7, h=height, $fn=100);
        cylinder(r=inner_radius, h=height+1);
    };