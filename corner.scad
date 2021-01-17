
use <brick.scad>
include <globals.scad>

module corner(length=2, height=1/3, type="brick"){
    translate([stud_spacing/2,0,0]) 
        difference(){
            block(width=length, length=1, height=height, type=type);
            translate([-stud_spacing+wall_thickness+wall_play, stud_spacing/2-wall_thickness-wall_play-0.3, 0]) 
                cube([stud_spacing-2*wall_thickness-wall_play ,wall_thickness+0.3, brick_height*height-roof_thickness]);
     }

    translate([0,stud_spacing/2,0]) 
        rotate([0,0,90]) 
        difference(){
            block(width=length, length=1, height=height, type=type);
            translate([-stud_spacing+wall_thickness+wall_play, -stud_spacing/2+wall_play-0.05, 0]) 
                cube([stud_spacing-2*wall_thickness-wall_play ,wall_thickness+0.3, brick_height*height-roof_thickness]);
        }
}