smooth = 100;

strip_width = 12;
strip_thickness = 4;

arm_width = 10;
arm_thickness = 2;
arm_height = strip_thickness + 2;

grip_width = 10;
grip_thickness = arm_thickness + 1.5;
grip_height = 1;

module arm() {
    cube([arm_width,arm_thickness,arm_height], center=true);
    translate([0,(grip_thickness/2)-1,(arm_height/2)+0.5]) 
        cube([grip_width,grip_thickness,grip_height], center=true);
}

module diffuser() {
    difference() {
        cylinder(h=2, r1=7, r2=7, $fn=smooth);
        translate([0,0,-1]) cylinder(h=4, r1=1.5, r2=1.5, $fn=smooth);
    }
}

module all() {
    arm();
    translate([0,14,0]) rotate([0,0,180]) arm();
    translate([0,7,-3]) diffuser();
}

all();
//translate([0,0,10]) all();