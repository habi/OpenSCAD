$fn = 100;

use <bottom_pin.scad>

module hollowsphere(OuterRadius=5, WallThickness=1) {
	InnerRadius = OuterRadius-WallThickness;
	difference() {
		sphere(OuterRadius);
		sphere(InnerRadius);
        translate([0,0,OuterRadius+WallThickness]) cube(2*OuterRadius, center=true);
	}
}

// Bottom pin
pin(height=15);
// Squashed cup
translate([0,0,3.5]) scale([0.75,1,1]) hollowsphere();
