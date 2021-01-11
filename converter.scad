use <brick.scad>
include <globals.scad>

module block_top(width, length) {
    translate([0,0,-1/3*brick_height])difference(){
        block(width=width,
            length=length,
            height=1/10,
            stud_type="hollow");
        translate([-length*stud_spacing/2,-length*stud_spacing/2,0])
            cube([length*stud_spacing,length*stud_spacing,1/3*brick_height-roof_thickness]);
    }

}

module brick_with_side_studs(width=1, length=1, height=1, south=true, north=true, east=true, west=true) {
        union(){
            block(
                width=width,
                length=length,
                height=height,
                spline_rescale=0.5
            );
            if(south){
                translate([0, -width/2*stud_spacing+wall_play, height/2*stud_spacing+height*(brick_height-stud_spacing)/*/2 to center*/])
                rotate([90,0,0])
                    block_top(min(length,height), max(length, height));
            }
            if(north){
                translate([0, width/2*stud_spacing-wall_play, height/2*stud_spacing+height*(brick_height-stud_spacing)/*/2 to center*/])
                rotate([-90,0,0])
                    block_top(min(length,height), max(length, height));
            }
            if(east){
                translate([length/2*stud_spacing-wall_play, 0, height/2*stud_spacing+height*(brick_height-stud_spacing)/*/2 to center*/])
                rotate([0,90,0])
                    block_top(min(width,height), max(width, height));
            }
            if(west){
                translate([-length/2*stud_spacing+wall_play, 0, height/2*stud_spacing+height*(brick_height-stud_spacing)/*/2 to center*/])
                rotate([0,-90,0])
                    block_top(min(width,height), max(width, height));
            }
        }
}

// block_top(1,2);
brick_with_side_studs(1,4,1);