use <brick.scad>
include <globals.scad>


module slope_pos(width=2,length=1,height=1, base_height=1/5){
    translate([0, width*stud_spacing-wall_play,0]) rotate([90,0,0]) 
    linear_extrude(width*stud_spacing-2*wall_play)
        polygon([
            // [0+wall_play,0], 
            [0+wall_play,base_height*brick_height], 
            [0+wall_play+wall_thickness,base_height*brick_height], 
            [length*stud_spacing+wall_thickness, height*brick_height],
            [length*stud_spacing, height*brick_height], 
            ]);
}

module slope_neg(width=2,length=1,height=1, base_height=1/5){
    translate([0, width*stud_spacing,0]) rotate([90,0,0]) 
    linear_extrude(width*stud_spacing)
        polygon([
            [0,0], 
            [0+wall_play, 0], 
            [0+wall_play, base_height*brick_height], 
            [length*stud_spacing, height*brick_height],
            [length*stud_spacing, (height+1/3)*brick_height],
            [0, (height+1/3)*brick_height]
            ]);
}

module slope_brick(width=2, length=2, height=1, slope_start=1, slope_end=1/5, corner=false, inverted=false){
    center(width, length)
    difference() {
        union() {
            uncenter(width, length) block(width=width, length=length, height=height, force_orientation=true);
            slope_pos(width, length-slope_start, height, slope_end);
            if (corner) {
                translate([0,width*stud_spacing]) rotate([0,0,-90])
                    slope_pos(length, width-slope_start, height, slope_end);
            }
        }
        slope_neg(width, length-slope_start, height, slope_end);
        if (corner) {
            translate([0,width*stud_spacing]) rotate([0,0,-90]) 
                slope_neg(length, width-slope_start, height, slope_end); 
        }
    }
}


module slope_brick_inverted(width=2, length=2, height=1, slope_start=1, slope_end=1/5, corner=false, inverted=true){
    // center(width, length)
    difference() {
        union() {
            uncenter(width, length) block(width=width, length=length, height=height, force_orientation=true);
            translate([length*stud_spacing, 0, height*brick_height]) rotate([0,180,0]) 
                slope_pos(width, length-slope_start, height, slope_end);
            if (corner) {
                translate([length*stud_spacing, width*stud_spacing, height*brick_height]) rotate([0,180,90]) 
                    slope_pos(length, width-slope_start, height, slope_end);
            }
        }
        translate([length*stud_spacing, 0, height*brick_height]) rotate([0,180,0]) 
            slope_neg(width, length-slope_start, height, slope_end);
        if (corner) {
            translate([length*stud_spacing,(width)*stud_spacing, height*brick_height]) rotate([0,180,90]) 
                slope_neg(length, width-slope_start, height, slope_end); 
        }
    }
}

// slope_brick_inverted(4, 3, 1, slope_start=2, corner=true);
%# place(0,0.5,0) rotate([0,0,90]) block(1,2,1);

slope_brick();
place(3,0,0) slope_brick(corner=true);

place(6,0,0) slope_brick_inverted(corner=false);
place(9,0,0) slope_brick_inverted(corner=true);

place(0, 3,0) slope_brick(4,3);

place(4, 3,0) slope_brick(2,3, corner=true);