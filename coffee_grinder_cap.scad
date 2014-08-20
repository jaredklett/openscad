smooth = 300;

module coffee_grinder_cap()
{
	difference() {
		cylinder(h = 12, r = 95, $fn=smooth);
		translate([0,0,5]) cylinder(h = 10, r = 93.4125, $fn=smooth);
		translate([0,0,-1]) cylinder(h = 10, r = 30, $fn=smooth);
	}
}

coffee_grinder_cap();
