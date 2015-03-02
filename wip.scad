smooth = 100;

module ring() 
{
  difference() {
    cylinder(h = 5, d = 24, $fn = smooth);
    translate([0,0,-1]) cylinder(h = 7, d = 19, $fn = smooth);
  }
}

module strip_base()
{
  cube(size = [80,10,5]);
}

rotate([0,90,0]) ring();
translate([0,-5,10]) strip_base();