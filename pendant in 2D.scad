smooth = 200;

module main_design(design_height=3, cyl_d=6, spoke_w=0.5)
{
    circle(d=6, $fn=smooth); // center pillar
    
    for (i=[0:23])
    {
        // Outer ring
        rotate([0,0,i*360/24])
        translate([58/2,0,0])
        circle(d=cyl_d, h=design_height, $fn=smooth);
    
        // Spokes
        rotate([0,0,(i*360/24)])
        translate([7,-0.5,0]) // the radius of the center cylinder plus one
        square([20,spoke_w], center=false);
    }
    
    for (i=[0:11])
    {
        // Inner ring
        rotate([0,0,i*360/12])
        translate([29/2,0,0])
        circle(d=cyl_d, h=design_height, $fn=smooth);
    }
}

main_design(3, 5, 1);