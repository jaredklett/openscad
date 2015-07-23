smooth = 200;

module diffuser() {
    difference() {
        sphere(d = 27, $fn = smooth);
        translate([0,0,-15]) cube([30,30,30], center = true);
        translate([0,0,-1]) sphere(d = 24, $fn = smooth);
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

gemma_setting();
translate([-2.5,0,-12]) rotate([0,90,0]) ring();
translate([0,0,15]) diffuser();