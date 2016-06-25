smooth = 50;
one_inch_in_mm = 25.4;
segment_length = one_inch_in_mm * 6;
led_channel_width = 6;
led_channel_height = 3;

module diffuser_piece() {
    difference() {
        cylinder(h = segment_length, d = one_inch_in_mm, $fn=smooth);
        translate([0,one_inch_in_mm/2,segment_length/2]) cube([one_inch_in_mm,one_inch_in_mm,segment_length], center=true);
        translate([0,0,segment_length/2]) cube([led_channel_width,led_channel_height,segment_length], center=true);
    }
}

translate([5,5,5]) diffuser_piece();