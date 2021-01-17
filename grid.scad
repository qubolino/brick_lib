use <brick.scad>
include <globals.scad>

hole_width=2;
hole_offset=1;

module grid(width=2, length=2) {
        difference(){
            block(
                type="tile",
                width=width,
                length=length,
                height=1/3,
                spline_rescale=0.5
            );

            for (i=[0:(width*stud_spacing-hole_offset)/(2*hole_width)])
                translate([-length/2*stud_spacing,-width/2*stud_spacing+hole_offset+i*hole_width*2,1.7])
                    cube([length*stud_spacing,hole_width,1.5+0.001]);
        }
}

grid(2,2);