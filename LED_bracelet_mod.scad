
difference()
{
    translate([115,-140,0]) import("/Users/jklett/Development/openscad/ledBracelet_trinket.GladysRevised.stl");
    translate([8,-6.5,5.5]) rotate([0,0,-50]) cube([15,7,4], center=true);
    translate([8,-6.5,33.4]) rotate([0,0,-50]) cube([15,7,4], center=true);
}

//translate([10,-20,5]) cube([3.1,3,3]);