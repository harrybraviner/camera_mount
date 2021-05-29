include <params.scad>
include <gears.scad>

module screw_gear() {
    difference() {
        herringbone_gear(modul=gear_module, tooth_number=screw_gear_teeth, width=gear_width, bore=0.0, pressure_angle=gear_pressure_angle, helix_angle=gear_helix_angle, optimized=false);
    
        // Cut-out for the nut
        union() {
            //translate([0.0, 0.0, -eps]) {
                //cylinder(d=screw_clearance_diameter, h=(gear_width-screw_nut_height)/2+2*eps);
            //};
            
            //translate([0.0, 0.0, gear_width/2 +screw_nut_height/2 - eps]) {
                //cylinder(d=screw_clearance_diameter, h=(gear_width-screw_nut_height)/2+2*eps);
            //};
            
            translate([0.0, 0.0, -eps]) {
                cylinder(r=screw_nut_hex_width/sqrt(3), h=gear_width + 2*eps, $fn=6);
            };
        }
    }
}

screw_gear();