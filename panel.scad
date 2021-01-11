
use <brick.scad>
include <globals.scad>


module panel(width=6, height=3, sides=true, top=true) {
    if (top) {
        translate([0,0,brick_height*(height-1/3)])
            block(width,1,1/3);
    }
    block(width,1,1/3, type="tile");
    translate([-stud_spacing*width/2+wall_play, -stud_spacing/2+wall_play ,brick_height/3])
        cube([stud_spacing*width-2*wall_play, 1.5-wall_play,brick_height*(height-1/3)]);
        
    if(sides) {
        translate([stud_spacing*width/2-wall_thickness-wall_play,-stud_spacing/2+wall_play,brick_height/3])
            cube([wall_thickness,stud_spacing*1-2*wall_play,brick_height*(height-1/3)]);
        translate([-stud_spacing*width/2+wall_play, -stud_spacing/2+wall_play,brick_height/3])
            cube([wall_thickness,stud_spacing*1-2*wall_play,brick_height*(height-1/3)]);
    }
}


module profile(){
    translate([0,3,0])rotate([180,0,0]) polygon([[0,0],[0,1],[1,1],[3,3],[5,3],[7,1],[8,1],[8,0],[6.6,0],[4.6,2],[3.4,2],[1.4,0]]);
}

module container(width=6, height=3, sides=true) {
    difference(){
        union(){
            translate([0,0,brick_height*(height-1/3)])
                    block(width,1,1/3);
            block(width,1,1/3, type="tile");
            
            for( i = [0 : width-1] ){
                translate([i*stud_spacing-stud_spacing*width/2, 1-wall_play,brick_height/3]) linear_extrude(brick_height*(height-1/3)) profile();
            }
            //TODO trim profile

            if(sides) {
                translate([stud_spacing*width/2-wall_thickness-wall_play,-stud_spacing/2+wall_play,brick_height/3])
                    cube([wall_thickness,stud_spacing*1-2*wall_play,brick_height*(height-1/3)]);
                translate([-stud_spacing*width/2+wall_play, -stud_spacing/2+wall_play,brick_height/3])
                    cube([wall_thickness,stud_spacing*1-2*wall_play,brick_height*(height-1/3)]);

            }
        }
    }
}
//profile();

// wall(4,3);

container(6,5,true);
