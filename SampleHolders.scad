$fn=100;
outer_radius = 6.3/2;

// Orgelpfeifen
for (x = [0:10:50], y=[0:10:40]){
    translate([x, y, 0])
        difference() {
            cylinder(r=outer_radius, h=x/2);
            cylinder(r=(x+((y+1)*6))/100, h=x+2, center=true);
        }
    }
    
// Dickere Wände
height= 25;
translate([65, 0, 0])
for (x = [0:20:50], y=[0:20:50]){
    translate([x, y, 0])
        difference() {
            cylinder(r=2*outer_radius, h=height);
            cylinder(r=(x+y)/40+4, h=80, center=true);
            }
    }

// Im Kreis rum
translate([50, 70, 0])    
for ( i = [5:0.25:10] ){
    rotate(i * 100, [0, 0, 1])
    translate([0, 3*i-7, 0])
    difference() {
            cylinder(r=outer_radius, h=5*i-25);
            cylinder(r=i/3.3, h=55, center=true);
        }
    }