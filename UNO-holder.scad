// Make a holder for a UNO deck of cards
$fn=100;

wallthickness=2;
height=31.1+wallthickness;
width=56.1+wallthickness;
depth=87.0+wallthickness;

// This is the deck we want to pack
module deck(){
    cube([width,depth,height]);
}

// Construct us a holder
difference() {
    // General outer hull
    minkowski() {
            deck();
        sphere(wallthickness, center=true);
        }
    union() {
        // elongated deck, so we cut off the top lid
        scale([1.1,1,1]) #deck();
        // Bottom cutout
        translate([0,depth-20,(height/2)]) #scale([1,1.6,1]) cylinder(r=7,h=height+3*wallthickness,center=true);
        translate([0,20,(height/2)]) #scale([1,1.6,1]) cylinder(r=7,h=height+3*wallthickness,center=true);
    }
} 
