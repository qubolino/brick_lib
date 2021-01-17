use <brick.scad>;
use <Lego-Angle-Plate.scad>;


// normal block fm -- good fit
block(
    width=2,
    length=2,
    height=1/3,
    stud_rescale=1.03,
    spline_rescale=0.5
    );

// upside down fm
rotate([180,0,0])
    block(
        width=2,
        length=2,
        height=1/3,
        stud_rescale=1.03,
        spline_rescale=0.8
    );

// print uipside down
rotate([180,0,0])
    angle_plate(
        angle=90, base_stud_length=2, base_stud_width=1, overhang_stud_length=4, overhang_stud_width=1,        stud_rescale=1.03 );