outer_enclosure_height = 18;
diffuser_height = 4;
diffuser_square_hole_dim = [6.4,6.4,2];
outer_enclosure_face_depth = 1;
smooth = 200;

module main_design(design_height=3, cyl_d=6, spoke_w=0.5)
{
    cylinder(d=6, h=design_height, $fn=smooth); // center pillar
    
    for (i=[0:23])
    {
        // Outer ring
        rotate([0,0,i*360/24])
        translate([58/2,0,0])
        cylinder(d=cyl_d, h=design_height, $fn=smooth);
    
        // Spokes
        rotate([0,0,(i*360/24)])
        translate([7,-0.5,0]) // the radius of the center cylinder plus one
        cube([20,spoke_w,design_height], center=false);
    }
    
    for (i=[0:11])
    {
        // Inner ring
        rotate([0,0,i*360/12])
        translate([29/2,0,0])
        cylinder(d=cyl_d, h=design_height, $fn=smooth);
    }
}

module diffuser()
{
    difference()
    {
        cylinder(r=(68/2), h = diffuser_height, $fn=smooth);
        for (i=[0:23])
        {
            // Outer ring
            rotate([0,0,i*360/24])
            translate([58/2,0,1])
            cube(diffuser_square_hole_dim, center = true);
        }
        for (i=[0:11])
        {
            // Inner ring
            rotate([0,0,i*360/12])
            translate([29/2,0,1])
            cube(diffuser_square_hole_dim, center = true);
        }
        translate([0,0,1]) cube(diffuser_square_hole_dim, center = true); // center hole
    }
}

module outer_enclosure()
{
    difference()
    {
        cylinder(r=(68/2) + 2, h=outer_enclosure_height, $fn=smooth);
        // Cutout might need to be 1mm larger to accommodate neopixel ring
        translate([0,0,1]) cylinder(r=(68/2) + 1,h=outer_enclosure_height + 2, $fn=smooth);
        translate([0,0,-1]) cylinder(r=(68/2) - 1,h=outer_enclosure_height + 2, $fn=smooth);
        // 10mm height for diffuser, rings, protective insert
        // 7mm height for lipo backpack
        // lip
        translate([0,0,outer_enclosure_height - 1]) cylinder(r=(68/2) + 1.5, h = 3, $fn = smooth);
        // trinket hole
        rotate([0,0,90]) translate([-18,0,10]) cube([38,18,6], center=true);
        // switch hole
        translate([20,-(68/2)+8,11]) rotate([0,0,40]) cube([11.75,7,4.25], center=true);
    }
    rotate([0,0,180]) translate([0,-37,9]) necklace_loop();
}

module laser_cutting()
{
    difference()
    {
        cylinder(r=(68/2), h=1, $fn=smooth);
        translate([0,0,-1]) main_design(3, 5, 1);
    }
}

module protective_insert()
{
  difference() {
    cylinder(h = 0.5, r=(68/2), $fn = smooth);
    // windows for contacts
    // GND on 24 neopixel ring
    translate([-((68/2) - (7/2)),17/2,-1]) rotate([0,0,-15]) cube([7,17,4], center=true);
    // I/O on 24 neopixel ring
    translate([((68/2) - (7/2)),17/2,-1]) rotate([0,0,15]) cube([7,21,4], center=true);
    // PWR on 24 neopixel ring
    translate([-((68/2) - (17/2)),-17,-1]) rotate([0,0,39]) cube([7,17,4], center=true);
  }
  // Needs to be turned around
  translate([13.97/2,-(68/2)+1.778,0.25]) rotate([0,0,180]) trinket_pro_mounting();
}

module trinket_pro_mounting()
{
    cylinder(h = 4, d = 2, $fn = smooth);
    translate([13.97,0,0]) cylinder(h = 4, d = 2, $fn = smooth);
    translate([13.97/2,-25.908,0]) cylinder(h = 4, d = 2, $fn = smooth);
}

module backplate()
{
    cylinder(h = 1, r=(68/2) + 0.5, $fn=smooth);
    difference()
    {
        translate([0,0,1]) cylinder(h = 3, r=(68/2) - 0.5, $fn=smooth);
        translate([0,0,1]) cylinder(h = 5, r=(68/2) - 1, $fn=smooth);
    }
}

module necklace_loop()
{
    difference()
    {
        cylinder(h = 6, d = 10, $fn = smooth);
        translate([0,0,-1]) cylinder(h = 8, d = 6, $fn = smooth);
        translate([0,7,-1]) cylinder(h = 12, d = 12, $fn = smooth);
        translate([0,8,1]) cube([12,12,12], center=true);
    }
}

module trinket_pro()
{
    color("SteelBlue") cube([38,18,4], center=true);
}

module lipo_backpack()
{
    color("CadetBlue") cube([17,15,7], center=true);
}

module lipo_battery()
{
    color("DarkGray") cube([36,29,5], center=true);
}

// Actual rendering calls

//laser_cutting();
//rotate([0,0,180]) protective_insert();
//translate([0,0,20]) rotate([0,180,0]) diffuser();
outer_enclosure();
//backplate();
//translate([0,0,20]) rotate([180,0,0]) render() outer_enclosure();
//rotate([0,0,90]) translate([-15,0,8]) trinket_pro();
//translate([-5,-18,8]) lipo_backpack();
//rotate([0,0,90]) translate([0,-19,8]) lipo_battery();