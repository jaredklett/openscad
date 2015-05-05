outer_enclosure_height = 10;
outer_enclosure_face_depth = 1;
smooth = 50;

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

module main_design()
{
    translate([0,0,-1]) cylinder(d=6, h=3); // center hole
    //cylinder(r=68/2,h=1, $fn=smooth);
    //cylinder(d=6, h=3, $fn=smooth); // center hole
    
    for (i=[0:23])
    {
        // Outer ring
        rotate([0,0,i*360/24])
        translate([58/2,0,0])
        translate([0,0,-1])
        cylinder(d=6, h=3);
        //cylinder(d=6, h=3, $fn=smooth);
    
        // Spokes
        rotate([0,0,i*360/24])
        translate([14.5,0,0])
        translate([0,0,1.5-1])
        cube([21,0.5,3], center=true);
    }
    
    for (i=[0:11])
    {
        // Inner ring
        rotate([0,0,i*360/12])
        translate([29/2,0,0])
        translate([0,0,-1])
        cylinder(d=6, h=3);
        //cylinder(d=6, h=3, $fn=smooth);
    }
}

module diffuser()
{
    difference()
    {
        render()
        {
            cylinder(r=(68/2), h = 5);
            translate([0,0,5]) main_design();
        }
        translate([0,0,-1]) main_design();
    }
}

module outer_enclosure()
{
    difference()
    {
        cylinder(r=(68/2) + 1,h=outer_enclosure_height);
        // Cutout might need to be 1mm larger to accommodate neopixel ring
        translate([0,0,1]) cylinder(r=68/2,h=outer_enclosure_height);
        main_design();
    }
}

/*
for (i=[0:23])
{
	rotate([0,0,i*360/24]) translate([58/2,0,1]) spike();
}
*/

// Actual rendering calls

//render() outer_enclosure();
render() diffuser();
