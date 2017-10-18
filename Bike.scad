$fn=100;
frameheight=40;
tubediameter=5;

// Elements
module wheel(diameter=26, tyrediameter=2.6, spokes=18) {
    // hub
    difference(){
        union(){// spokes
            for (angle = [0 : 360/spokes : 360])
                rotate([0,0,angle]) // rotate the spokes
                translate([0,diameter/2,0]) // translate from the center outwards
                cube([1, diameter, 1], center=true); // make the spokes
            // hub
            circle(r = diameter/5);
        }
        // hub hole
        circle(r =diameter/5-1);
        }        
    // tire
    rotate_extrude()
    translate([diameter, 0, 0])
    circle(d=tyrediameter);
    }

module frame(height=frameheight, diameter=tubediameter) {
    // seat tube
    rotate([10,90,-90]) cylinder(h=height, d=diameter, center=true);
    // top tube
    translate([height/2,-height/2,0]) rotate([0,90,0]) cylinder(h=height+height/10, d=diameter, center=true);    
    // down tube
    translate([height/2,0,0]) rotate([45,90,0]) cylinder(h=height++height/3,d=diameter, center=true);        
    // seat stays
    translate([-height/2,0,0]) rotate([45,90,0]) cylinder(h=height+height/3,d=diameter, center=true);
    // chain stay
    translate([-height/2,height/2-diameter,0]) rotate([0,90,0]) cylinder(h=height+height/10,d=diameter, center=true);
    // bottom bracket
    translate([diameter,height/2-diameter,0]) cylinder(r = 5, h=10, center=true);    
    }

module fork(height=frameheight, diameter=5){
    rotate([-70,90,0]) cylinder(h=height,d=diameter, center=true);
}    
    
module handlebars(width=40, diameter=tubediameter){
    cylinder(h=width, d=diameter, center=true);
    rotate([45,90,0]) translate([0,-2,-3])  cylinder(h=diameter*2,d=diameter, center=true);
}

module saddle(){
    scale([3, 1, 2]) sphere(d=10);
    rotate([-90,0,-15]) cylinder(h=12, d=tubediameter*0.8);    
}
    
// Build
frame();
translate([frameheight+tubediameter,0,0]) fork();
translate([frameheight+tubediameter,-frameheight/2-tubediameter,0]) handlebars();
translate([-tubediameter,-frameheight/2-10,0]) saddle();
// wheels
translate([0,frameheight/2-tubediameter/2,0]) { // shift both wheels down a bit
    translate([-frameheight,0,0]) wheel();
    translate([frameheight+3*tubediameter,0,0]) wheel();
}
