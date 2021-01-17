use <brick.scad>
include <globals.scad>

// module round_brick(width=2, height=1, type="brick"){
//     difference(){
//         union(){

//             block(width, width, height, type=type);
//             // shell
//             translate([0, 0, 1/3*brick_height]) 
//                 difference(){
//                     cylinder(d=width*stud_spacing-wall_play,h=(height-1/3)*brick_height);
//                     cylinder(d=width*stud_spacing-wall_thickness,h=(height-1/3)*brick_height);
//                 }
//         }
//         difference(){
//             cylinder(d=(width+1)*stud_spacing,h=(height+1)*brick_height);
//             cylinder(d=width*stud_spacing-wall_play,h=(height+1)*brick_height);
//         }
//     }
// }

// round_brick();
// round_brick(height=1/3);
// round_brick(height=1/3, type="tile");

// round_brick(1);

module stud_v2(rescale=1.0, hollow=false){
    translate([-stud_spacing/2, -stud_spacing/2,0])
    difference() {
        cylinder(r=(stud_diameter*rescale)/2,h=stud_height,$fs=cylinder_precision);

        if (hollow) {
            // 0.5 is for cleaner preview; doesn't affect functionality.
            cylinder(r=(hollow_stud_inner_diameter*rescale)/2,h=stud_height+0.5,$fs=cylinder_precision);
        }
    }

}

module post_v2(height=1) {
    translate([-stud_spacing/2, -stud_spacing/2,0])
    difference() {
        cylinder(d=post_diameter, h=height*brick_height-roof_thickness,$fs=cylinder_precision);
        cylinder(r=(post_diameter/2)-post_wall_thickness, h=height*brick_height-roof_thickness,$fs=cylinder_precision);
    }
}


module axle_v2(height) {
    translate([-stud_spacing/2, -stud_spacing/2,0])
    union() {
        cube([axle_diameter,axle_spline_width,(height+1)*brick_height],center=true);
        cube([axle_spline_width,axle_diameter,(height+1)*brick_height],center=true);
    }
}



module round_brick_shell(width=2, height=1){
    difference() {
        cylinder(d=width*stud_spacing-2*wall_play, h=height * brick_height);
        cylinder(d=width*stud_spacing-wall_thickness*2, h=brick_height*height-roof_thickness);
    }
}

module round_brick(width=2, height=1, type="brick"){
    // center(width, width)
    difference(){
        union(){
            place(1,1,0) round_brick_shell(width, height);
            if (type == "brick"){
                place(1,1,height) stud_v2(rescale=STUD_SCALE_UP, hollow=hollow);
                place(1,2,1) stud_v2(rescale=STUD_SCALE_UP, hollow=hollow);
                place(2,1,1) stud_v2(rescale=STUD_SCALE_UP, hollow=hollow);
                place(2,2,1) stud_v2(rescale=STUD_SCALE_UP, hollow=hollow);
            }
            if (type == "brick" && width > 1)
                place(1.5,1.5,0) post_v2(height);
            
        }

        place(1,1,0) stud_v2(rescale=STUD_SCALE_DOWN);
        place(1,2,0) stud_v2(rescale=STUD_SCALE_DOWN);
        place(2,1,0) stud_v2(rescale=STUD_SCALE_DOWN);
        place(2,2,0) stud_v2(rescale=STUD_SCALE_DOWN);
        if (type == "brick" && width > 1)
            place(1.5,1.5,0) axle_v2(height);
    }
            
}

// round_brick(2,1/3,"tile");
round_brick(2,1);
// post_v2(1);