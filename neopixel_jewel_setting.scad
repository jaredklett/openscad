smooth = 200;

module diffuser() {
    difference() {
        sphere(d = 27, $fn = smooth);
        translate([0,0,-15]) cube([30,30,30], center = true);
        translate([0,0,-1]) sphere(d = 24, $fn = smooth);
    }
}

module ring_and_setting() {
    difference() {
        cylinder(d = 29, h = 9, $fn = smooth);
        translate([0,0,1]) cylinder(d = 28, h = 9, $fn = smooth);
    }
}

ring_and_setting();
translate([0,0,15]) diffuser();