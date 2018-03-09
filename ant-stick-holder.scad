// Holder to hang my my https://buy.garmin.com/en-US/US/p/10997 onto the book-rack in the living room (where I use it the most)

wallthickness = 2;
width = 15;
height = 9.75;
metalwidth = 4;
depth = 4.25+metalwidth+3*wallthickness;

// USB-connector
module usb() {cube([4.55, 12.55, 9.85]);}

difference() {
    difference() {
        // main body
        translate([0,(width-12.25)*-0.5,0]) cube([depth,width,height+2*wallthickness]);
        // Slot in the back to 'mount' it
        translate([depth-metalwidth-wallthickness,-wallthickness,-wallthickness])
            #cube([metalwidth,width+0.5*wallthickness,height+2*wallthickness]);
    }
    // ANT stick slot
    translate([wallthickness,0,wallthickness]) #usb();
    translate([wallthickness,0,height+wallthickness]) #usb();
}