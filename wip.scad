//index_finger_length = 

smooth = 100;

module ring() 
{
  difference() {
    // TODO: smooth the edges?
    cylinder(h = 5, d = 24, $fn = smooth);
    translate([0,0,-1]) cylinder(h = 7, d = 19, $fn = smooth);
  }
}

module strip_base()
{
  cube(size = [80,10,5]);
  // TODO: needs indentation for LED strip
  // TODO: maybe some overhang back over the knuckle
}

module diffuser()
{
  difference() {
    cylinder(h = 80, d = 10, $fn = smooth);
    translate([-2,0,-2]) cylinder(h = 84, d = 8, $fn = smooth);
  }
}
/*
rotate([0,90,0]) ring();
translate([15,0,0]) rotate([0,90,0]) ring();
translate([0,-5,10]) strip_base();
*/
//translate([0,0,20]) rotate([0,90,0]) diffuser();
diffuser();

/*


module squares()
{
   square(10);
   translate([25,0,0]) square(10);
}


hull() {
   translate([15,0,0]) circle(10);
   circle(10);
   translate([-10,-10,0]) squares();
}

*/
