smooth = 35;

cube_side = 26;
cylinder_height = cube_side * 0.75;
cylinder_diameter = cube_side * 0.625;

module brick() {
    translate([0,0,cube_side/2]) cube([cube_side,cube_side,cube_side], center=true);
    translate([0,0,(cube_side/2) + 1]) cylinder(h = cylinder_height, d = cylinder_diameter, $fn=smooth);
}

difference() {
    brick();
    translate([0,0,-1]) cylinder(h = cylinder_height + 3, d = cylinder_diameter + 1, $fn=smooth);
}