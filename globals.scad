
// brick dependent parameters
brick_height = 9.6; // Height of the non-stud portion of a regular brick.
stud_spacing=8; // Distance between centers of studs.
stud_diameter=4.85; // Diameters of studs.
wall_play=0.1; // Amount of space removed from the outer edge of bricks so that they will fit next to each other.
roof_thickness=1;
wall_thickness=1.45;

post_wall_thickness = 0.85;
pin_diameter=3 ;
post_diameter=6.5;

hollow_stud_inner_diameter = 3.1;
stud_height = 1.8;

axle_spline_width = 2.0;
axle_diameter = 5 * 1;

$fn=50;

// printing depoendent parameters
STUD_SCALE_UP = 1.03;
STUD_SCALE_SIDE = 1.0;
STUD_SCALE_DOWN = 1.0;
SPLINE_SCALE_DOWN = 0.5;
SPLINE_SCALE_UP = 1.0;
SPLINE_SCALE_SIDE = 0.5;

module uncenter(width, length, height) {
    translate([((8 * length) / 2), ((8 * width) / 2), height ? ((8 * height) / 2) : 0]) children();
}

module center(width, length, height) {
    translate([-((8 * length) / 2), -((8 * width) / 2), height ? -((8 * height) / 2) : 0]) children();
}

module place(x, y, z=0) {
    translate([8 * y, 8 * x, z * 9.6]) children();
}
