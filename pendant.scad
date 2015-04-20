thick=0.5;
height=10;
smooth=50;

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
module ring()
{
	render() difference()
	{
		cylinder(r=68/2,h=1);
		cylinder(r=48/2,h=1);
	}
}

/*
for (i=[0:23])
{
	rotate([0,0,i*360/24]) translate([58/2,0,1]) spike();
}
*/

render() difference()
{
	cylinder(r=68/2,h=1);
	cylinder(r=3,h=1);
	//cylinder(r=68/2,h=1, $fn=smooth);
	//cylinder(r=3,h=1, $fn=smooth);

	for (i=[0:23])
	{
		rotate([0,0,i*360/24])
		translate([58/2,0,0])
		translate([0,0,-1])
		cylinder(d=6, h=3);
		//cylinder(d=6, h=3, $fn=smooth);

		rotate([0,0,i*360/24])
		translate([14.5,0,0])
		translate([0,0,1.5-1])
		cube([21,0.5,3], center=true);

		rotate([0,0,i*360/24])
		translate([14.5,0,0])
		translate([0,0,1.5-1])
		cube([1,0.5,3], center=true);
	}

    for (i=[0:11])
    {
		rotate([0,0,i*360/12])
		translate([29/2,0,0])
		translate([0,0,-1])
		cylinder(d=6, h=3);
		//cylinder(d=6, h=3, $fn=smooth);
    }
}

