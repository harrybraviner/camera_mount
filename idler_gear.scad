include <params.scad>
include <gears.scad>

module idler_gear() {

difference() {
    herringbone_gear(modul=gear_module, tooth_number=motor_gear_teeth, width=gear_width, bore=0.0, pressure_angle=gear_pressure_angle, helix_angle=gear_helix_angle, optimized=false);

    union() {
        translate([0.0, 0.0, -eps])
            cylinder(d=idler_bolt_diameter + idler_extra_bolt_clearance_in_gear, h=gear_width+2*eps);
    };
};

};

idler_gear();   