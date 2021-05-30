include <params.scad>
include <gears.scad>

module motor_gear() {

difference() {
    herringbone_gear(modul=gear_module, tooth_number=motor_gear_teeth, width=gear_width, bore=0.0, pressure_angle=gear_pressure_angle, helix_angle=gear_helix_angle, optimized=false);

    union() {
        translate([0.0, 0.0, -eps])
            cylinder(d=motor_shaft_diameter + motor_shaft_extra_clearance_in_gear, h=gear_width+2*eps);
        
        translate([0.0, 0.0, gear_width/2.0]) rotate([0.0, 90.0, 0.85*360.0/motor_gear_teeth/2.0])
            cylinder(d=motor_grub_screw_hole_diameter, h=(gear_module*motor_gear_teeth));
    };
};

};

motor_gear();   