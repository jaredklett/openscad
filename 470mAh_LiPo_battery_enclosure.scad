// Models to hold a 470 mAh battery (43mm x 23mm x 6mm)
// Includes an additional piece for threading a strap,
// like on a pair of goggles.

// This model has the opening in the side
module side_hold()
{
  difference() {
    cube([46, 28, 11], center = true);
    translate([2,0,0]) cube([44, 24, 7], center = true);
  }

  translate([0,0,7]) {
    difference() {
      cube([46, 17, 4], center = true);
      translate([0,0,0]) cube([48, 15, 1], center = true);
    }
  }
}

// This model has the opening in the top w/groove for wires
module top_hold()
{
  difference() {
    cube([48, 28, 11], center = true);
    translate([0,-3,0]) cube([44, 24, 7], center = true);
    translate([22,-6,0]) cube([5, 30, 2], center = true);
  }

  translate([0,0,6]) {
    difference() {
      cube([48, 17, 6], center = true);
      translate([0,0,1]) cube([50, 15, 2], center = true);
    }
  }
}

module recycling_symbol()
{
  linear_extrude(height=10, center=false) translate([-70.28/2,-88.77/2,0]) import("pla7.dxf");
}

difference() {
  //side_hold();
  top_hold();
  rotate(a=[0,180,0]) translate([0,0,5]) resize([20,0,0], auto=true) recycling_symbol();
}
