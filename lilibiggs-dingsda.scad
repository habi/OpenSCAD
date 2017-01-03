$fn=100;
diameter = 60;
height= 30;
dice_lenght = 17;
wall_thickness=4;

difference() {
    hull() { //outer shell
        cylinder(d=diameter+wall_thickness, h=height+wall_thickness, center=true);
        translate([0.5*(diameter+sqrt(dice_lenght)),0.5*(diameter+sqrt(dice_lenght)),0.5*dice_lenght-0.5*wall_thickness]) rotate([0,0,45])  cube([dice_lenght+wall_thickness,dice_lenght+wall_thickness,dice_lenght+wall_thickness],center=true);
    }
    #translate([0,0,wall_thickness])cylinder(d=diameter, h=height, center=true);
    #translate([0.45*(diameter+sqrt(dice_lenght)),0.45*(diameter+sqrt(dice_lenght)),0.5*dice_lenght]) rotate([0,0,45])  cube([dice_lenght,dice_lenght,dice_lenght],center=true);

}