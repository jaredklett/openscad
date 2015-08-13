smooth = 200;

module maketext(str)
{
    text(str, font = "Arial", $fn=smooth);
}

module hack()
{
    maketext("H");
    translate([8.5,0,0]) maketext("A");
    translate([15.5,0,0]) maketext("C");
    translate([23.5,0,0]) maketext("K");
}

module rock()
{
    maketext("R");
    translate([8,0,0]) maketext("O");
    translate([17,0,0]) maketext("C");
    translate([25,0,0]) maketext("K");
}

module city()
{
    maketext("C");
    translate([8,0,0]) maketext("I");
    translate([10,0,0]) maketext("T");
    translate([17.5,0,0]) maketext("Y");
}

module hackrock()
{
    translate([1.5,9.8,0]) hack();
    rock();
}

module hackrockcity()
{
    scale([1.31,1.31,5]) hackrock();
    rotate([0,0,90]) scale([1,1,5]) translate([-0.7,-54,0]) city();
}

linear_extrude(height = 5) scale([2,2,1]) translate([0,0,2.5]) hackrockcity();