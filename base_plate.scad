include <params.scad>
include <gears.scad>

module base_plate() {
    
    difference() {
        linear_extrude(height=base_plate_thickness)
            polygon(points=[[-11.75, -24.25], [-60.25, -24.25], [-60.25, +24.25], [-11.75, +24.25], [+45.0, +15.0], [+45.0, -15.0]]);
        
        union() {
            // Hole for screw
            translate([0.0, 0.0, -eps])
                cylinder(d=screw_clearance_diameter, h=base_plate_thickness + 2*eps);
            
            // Hole for motor shaft
            translate([-gear_offsets, 0.0, -eps])
                cylinder(d=motor_shaft_clearance_diameter, h=base_plate_thickness + 2*eps);

            // Locator hole for motor
            translate([-gear_offsets, 0.0, -eps])
                cylinder(d=motor_centre_circle_diameter, h=motor_centre_circle_depth+eps);
            
            // Screw holes for motor
            translate([-gear_offsets, 0.0, 0.0]) {
                translate([motor_screw_pattern_side_length/2, motor_screw_pattern_side_length/2, -eps])
                    cylinder(d=motor_screw_holes_diameter, h=base_plate_thickness + 2*eps);
                translate([motor_screw_pattern_side_length/2, -motor_screw_pattern_side_length/2, -eps])
                    cylinder(d=motor_screw_holes_diameter, h=base_plate_thickness + 2*eps);
                translate([-motor_screw_pattern_side_length/2, motor_screw_pattern_side_length/2, -eps])
                    cylinder(d=motor_screw_holes_diameter, h=base_plate_thickness + 2*eps);
                translate([-motor_screw_pattern_side_length/2, -motor_screw_pattern_side_length/2, -eps])
                    cylinder(d=motor_screw_holes_diameter, h=base_plate_thickness + 2*eps);
            };
            
            // Hole for idler shaft
            translate([+gear_offsets, 0.0, -eps])
                cylinder(d=idler_bolt_diameter, h=base_plate_thickness + 2*eps);
 
        };
        
    };
    
    // Motor locator walls
    difference() {
        translate([-gear_offsets, 0.0, -motor_locator_walls_depth/2 + eps/2])
            cube([motor_linear_side_length + motor_locator_walls_side_clearance + 2*motor_locator_walls_thickness, motor_linear_side_length + motor_locator_walls_side_clearance + 2*motor_locator_walls_thickness, motor_locator_walls_depth + eps], center=true);
        
        translate([-gear_offsets, 0.0, -motor_locator_walls_depth/2 + eps/2])
            cube([motor_linear_side_length, motor_linear_side_length, motor_locator_walls_depth + 3*eps], center=true);
    };
}

base_plate();