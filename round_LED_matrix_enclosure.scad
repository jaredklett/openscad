smooth = 200;
outer_height = 29;
finger_dim = [0.25,1,5];

module outer_container()
{
  difference() {
    cylinder(h = outer_height, r1 = 27.5, r2 = 27.5, $fn = smooth);
    // thru hole
    translate([0,0,1]) cylinder(h = outer_height + 2, r1 = 25.5, r2 = 25.5, $fn = smooth);
    // inner rim to hold the filter
    translate([0,0,-1]) cylinder(h = outer_height + 2, r1 = 23.5, r2 = 23.5, $fn = smooth);
    // 2mm lip
    translate([0,0,outer_height - 2]) cylinder(h = 3, r1 = 27, r2 = 27, $fn = smooth);
  }
}

module matrix_bracket()
{
  difference() {
    cylinder(h = 7, r1 = 25, r2 = 25, $fn = smooth);
    translate([-16.25,-16.25,-1]) cube([32.5,32.5,10]);
  }
}

module protective_insert()
{
  difference() {
    cylinder(h = 0.5, r1 = 25, r2 = 25, $fn = smooth);
    // window for IC
    translate([-5,-10,-1]) cube([10,20,4]);
    // window for contacts
    translate([-6,-20,-1]) cube([12,5,4]);
  }
  translate([7,10.5,0]) trinket_mounting();
}

module trinket_mounting()
{
    cylinder(h = 8, d = 1, $fn = smooth);
    translate([11.43,0,0]) cylinder(h = 8, d = 1, $fn = smooth);
    translate([0,-21.59,0]) cylinder(h = 8, d = 1, $fn = smooth);
    translate([11.43,-21.59,0]) cylinder(h = 8, d = 1, $fn = smooth);
}

module backplate()
{
  cylinder(h = 2, r1 = 27, r2 = 27, $fn = smooth);
  // fingers
  for (i=[0:23]) 
  {
      rotate([0,0,i*360/23])
      translate([25,0,2])
      cube(finger_dim, center=false);
  }
  rotate(a=[0,180,0]) translate([-18,0,0]) resize([10,0,0], auto=true) recycling_symbol();
}

module backplate_with_window()
{
  difference() {
    cylinder(h = 2, r1 = 27, r2 = 27, $fn = smooth);
    translate([-10,-19.5,-1]) cube([20,10,4]);
  }
}

module recycling_symbol()
{
  linear_extrude(height=4, center=false) translate([-70.28 / 2, -88.77 / 2, 0]) import("pla7.dxf");
}


outer_container();
translate([60,0,0]) matrix_bracket();
translate([0,60,0]) protective_insert();
translate([-60,0,0]) backplate();
//trinket_mounting();

///*
//translate([-60,0,0]) backplate_with_window();
//*/