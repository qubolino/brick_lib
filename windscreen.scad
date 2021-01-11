use <brick.scad>
include <globals.scad>


module windscreen(beam_thickness=2, beam_width=6, 
    height=4/3, length=4) {
        
    difference(){
        union(){
            // base blocks
            translate([0,8,0])block(length,1,1/3,type="tile");
            translate([0,0,brick_height*height])block(length,1,1/3,type="tile");
            translate([-(length-1)*stud_spacing/2,0,0])block(1,1,1/3,type="tile");
            translate([(length-1)*stud_spacing/2,0,0])block(1,1,1/3,type="tile");
            translate([-(length-1)*stud_spacing/2,0,brick_height*height])block(1,1,1/3);
            translate([(length-1)*stud_spacing/2,0,brick_height*height])block(1,1,1/3);

            // play gap filling
            translate([(length/2-1)*stud_spacing+wall_play, stud_spacing/2-wall_play, 0]) cube([stud_spacing-2*wall_play, 2*wall_play, brick_height/3]);
            translate([-(length/2)*stud_spacing+wall_play, stud_spacing/2-wall_play, 0]) cube([stud_spacing-2*wall_play, 2*wall_play, brick_height/3]);
            
            // vertical beams
            translate([length*stud_spacing/2-beam_thickness,-stud_spacing/2+wall_play,brick_height/3]) 
                cube([beam_thickness-wall_play, beam_thickness-wall_play, height*brick_height]);
            translate([-length*stud_spacing/2+wall_play,-stud_spacing/2+wall_play,brick_height/3]) 
                cube([beam_thickness-wall_play, beam_thickness-wall_play, height*brick_height]);

            // slope beams
            translate([-length*stud_spacing/2+wall_play,1.5*stud_spacing-beam_thickness-wall_play,(height+1/3)*brick_height])
            rotate([-90,0,-90])
            linear_extrude(beam_width) polygon([[stud_spacing,0],[stud_spacing-beam_thickness,0],
                    [-beam_thickness,brick_height*height],[0,brick_height*height]]);
            translate([length*stud_spacing/2-wall_play-beam_width,1.5*stud_spacing-beam_thickness-wall_play,(height+1/3)*brick_height])
            rotate([-90,0,-90])
            linear_extrude(beam_width) polygon([[stud_spacing,0],[stud_spacing-beam_thickness,0],
                    [-beam_thickness,brick_height*height],[0,brick_height*height]]);

        }
        
        // // lower holes
        translate([(length/2-1)*stud_spacing+wall_play,-stud_spacing/2+wall_play,0]) cylinder(r=4,h=brick_height/3);
        translate([-(length/2-1)*stud_spacing-wall_play,-stud_spacing/2+wall_play,0]) cylinder(r=4,h=brick_height/3);
        
        // play gap filling underneath removal
        translate([(length/2-1)*stud_spacing+wall_thickness+wall_play, stud_spacing/2-wall_thickness-0.4, 0]) cube([stud_spacing-2*wall_thickness-2*wall_play, 2*wall_thickness+0.8,brick_height/3-roof_thickness]);
        translate([-(length/2)*stud_spacing+wall_thickness+wall_play, stud_spacing/2-wall_thickness-0.4, 0]) cube([stud_spacing-2*wall_thickness-2*wall_play, 2*wall_thickness+0.8,brick_height/3-roof_thickness]);
        
        
        // translate([WALL_THICKNESS+PLAY,0,6*PLATE_HEIGHT])cube([UNIT_LENGTH-WALL_THICKNESS,UNIT_LENGTH-WALL_THICKNESS,PLATE_HEIGHT-ROOF_THICKNESS]);
        // translate([5*UNIT_LENGTH-space,0,6*PLATE_HEIGHT])cube([UNIT_LENGTH-WALL_THICKNESS,UNIT_LENGTH-WALL_THICKNESS,PLATE_HEIGHT-ROOF_THICKNESS]);
        
    }
}
windscreen();

