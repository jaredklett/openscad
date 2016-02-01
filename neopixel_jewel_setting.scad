smooth = 200;

diffuser_square_hole_dim = [6.4,6.4,3];
sphere_diameter = 9;
sphere_half_offset = -5;

module sphere_diffuser() {
    sphere(d = sphere_diameter, $fn = 20);
    for (i=[0:5])
    {
        rotate([0,0,i*360/6])
        translate([15/2,0,0])
        sphere(d = sphere_diameter, $fn = 20);
    }
}

module cone_diffuser() {
    cylinder(h = 8, r1 = sphere_diameter / 2, r2 = 0, $fn = 15);
    for (i=[0:5])
    {
        rotate([0,0,i*360/6])
        translate([15/2,0,0])
        cylinder(h = 8, r1 = sphere_diameter / 2, r2 = 0, $fn = 15);
    }
}

module diffuser_base() {
    difference() {
        // base
        cylinder(r = 25/2, h = 3, $fn=smooth);
        // cutouts for LEDs
        for (i=[0:5])
        {
            rotate([0,0,i*360/6])
            translate([17/2,0,0])
            cube(diffuser_square_hole_dim, center = true);
        }
        // center LED cutout
        cube(diffuser_square_hole_dim, center = true);
    }
}

module gemma_setting() {
    difference() {
        cylinder(d = 29, h = 9, $fn = smooth);
        translate([0,0,1]) cylinder(d = 28, h = 9, $fn = smooth);
    }
}

module ring() {
    difference() {
        // TODO: smooth the edges?
        cylinder(h = 5, d = 24, $fn = smooth);
        translate([0,0,-1]) cylinder(h = 7, d = 19, $fn = smooth);
    }
}

//cone_diffuser();
//difference() {
//    sphere_diffuser();
//    translate([0,0,-5]) cube([25,25,10], center = true);
//}
diffuser_base();
//translate([0,0,-5]) rotate([0,180,0]) diffuser_base();

//translate([0,0,-10]) gemma_setting();
//translate([-2.5,0,-12]) rotate([0,90,0]) ring();
//translate([0,0,15]) diffuser();