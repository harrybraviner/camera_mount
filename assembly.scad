include <params.scad>

use <base_plate.scad>
use <screw_gear.scad>
use <motor_gear.scad>
use <idler_gear.scad>
use <motor_mockup.scad>

base_plate();

translate([0.0, 0.0, base_plate_thickness + plate_gear_clearance])
    color("red")
    rotate([0.0, 0.0, 180.0 + (360.0*0.5/screw_gear_teeth)])
    mirror([1.0, 0.0, 0.0])
    screw_gear();
    
translate([-gear_offsets, 0.0, base_plate_thickness + plate_gear_clearance])
    color("blue")
    motor_gear();
    
translate([+gear_offsets, 0.0, base_plate_thickness + plate_gear_clearance])
    color("blue")
    idler_gear();
    
translate([-gear_offsets, 0.0, 0.0])
    color("green", alpha=0.5)
    motor_mockup();