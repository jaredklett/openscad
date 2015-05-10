outer_enclosure_height = 10;
diffuser_height = 1;
outer_enclosure_face_depth = 1;
smooth = 200;
/*
module globe()
{
	render() difference()
	{
		sphere(r=10/2);
		translate([0,0,-0.5]) sphere(r=10/2);
	}
}

module spike()
{
	render() difference()
	{
		cylinder(r1=10/2, r2=0, h=height, $fa=360/5);
		translate([0,0,-0.5]) cylinder(r1=10/2, r2=0, h=height, $fa=360/5);
	}
}
*/
module main_design(design_height=3)
{
    cylinder(d=6, h=design_height, $fn=smooth); // center pillar
    
    for (i=[0:23])
    {
        // Outer ring
        rotate([0,0,i*360/24])
        translate([58/2,0,0])
        cylinder(d=6, h=design_height, $fn=smooth);
    
        // Spokes
        rotate([0,0,i*360/24])
        translate([4,0,0]) // the radius of the center cylinder plus one
        cube([21,0.5,design_height], center=false);
    }
    
    for (i=[0:11])
    {
        // Inner ring
        rotate([0,0,i*360/12])
        translate([29/2,0,0])
        cylinder(d=6, h=design_height, $fn=smooth);
    }
}

module separator()
{
        cylinder(r=(68/2), h = 5);
}

module diffuser()
{
    difference()
    {
        render()
        {
            cylinder(r=(68/2), h = diffuser_height, $fn=smooth);
            translate([0,0,diffuser_height]) main_design(4);
        }
        for (i=[0:23])
        {
            // Outer ring
            rotate([0,0,i*360/24])
            translate([58/2,0,0])
            cube([6,6,1], center = true);
        }
        for (i=[0:11])
        {
            // Inner ring
            rotate([0,0,i*360/12])
            translate([29/2,0,0])
            cube([6,6,1], center = true);
        }
        cube([6,6,1], center = true); // center hole
    }
}

module outer_enclosure()
{
    difference()
    {
        cylinder(r=(68/2) + 1,h=outer_enclosure_height, $fn=smooth);
        // Cutout might need to be 1mm larger to accommodate neopixel ring
        translate([0,0,2]) cylinder(r=68/2,h=outer_enclosure_height, $fn=smooth);
        main_design();
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

/*
for (i=[0:23])
{
	rotate([0,0,i*360/24]) translate([58/2,0,1]) spike();
}
*/

// Actual rendering calls

render() diffuser();
//translate([0,0,20]) rotate([180,0,0]) render() outer_enclosure();
//translate([-5,15,8]) trinket_pro();
//translate([24,0,8]) lipo_backpack();
//translate([-5,-10,8]) lipo_battery();