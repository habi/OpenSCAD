// Sample holder for the *big* tumors of Curzio
// They are 'suspended' in a cylinder, so we can keep some PFA at the bottom
$fn = 100;

use <bottom_pin.scad>

// Bottom pin
pin(height=10);

height=50;
inner_radius=15;
wall_thickness=1.5;
// Outer wall
difference() {
    cylinder(h=height, r=inner_radius+wall_thickness); // outer wall
    translate([0,0,wall_thickness]) cylinder(h=height, r=inner_radius); // drill it into the outer cylinder
}
// Lift the tumor above the PFA
translate([0,0,5]) // move the inner holders up a bit
scale([1,1,1/0.618]) { // make everything a bit elliptic
    for (angle=[0:60:360-60]) rotate([0,0,angle]) { // we need several holders
        difference(){ // cut out a sphere from the walls
            translate([inner_radius/2,0,inner_radius/2]) cube([inner_radius,wall_thickness,inner_radius], center=true);  //walls
            translate([0,0,inner_radius]) #sphere(inner_radius, center=true); //sphere
            }
            rotate([0,0,180]) // sin/cos-calculation was easier like that :/
            translate([-inner_radius*sin(45),0,-inner_radius*cos(45)]) // move the holder plate up on the slope a bit
            translate([0,0,inner_radius]) // move some more
            rotate([0,45,0])  // tilt it
            cube([10,10,wall_thickness], center=true); // holder plate
        }
    }