include <params.scad>
include <gears.scad>

module base_plate() {
    
    difference() {
        linear_extrude(height=base_plate_thickness)
            polygon(points=[[-61.5, -25.5], [-61.5, +25.5], [+38.0, +25.5], [+38.0, -25.5]]);
        
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
            
            // Recesses for screw cap heads
            translate([-gear_offsets, 0.0, base_plate_thickness - motor_screw_holes_cap_depth + eps]) {
                translate([motor_screw_pattern_side_length/2, motor_screw_pattern_side_length/2])
                    cylinder(d=motor_screw_holes_cap_diameter, h=motor_screw_holes_cap_diameter);
                translate([motor_screw_pattern_side_length/2, -motor_screw_pattern_side_length/2])
                    cylinder(d=motor_screw_holes_cap_diameter, h=motor_screw_holes_cap_diameter);
                translate([-motor_screw_pattern_side_length/2, motor_screw_pattern_side_length/2])
                    cylinder(d=motor_screw_holes_cap_diameter, h=motor_screw_holes_cap_diameter);
                translate([-motor_screw_pattern_side_length/2, -motor_screw_pattern_side_length/2])
                    cylinder(d=motor_screw_holes_cap_diameter, h=motor_screw_holes_cap_diameter);
            };

            // Holes for idler shafts
            rotate([0.0, 0.0, +idler_offset_angle])
                translate([+gear_offsets, 0.0, -eps])
                    cylinder(d=idler_gear_shaft_baseplate_hole_diameter, h=base_plate_thickness + 2*eps);
            rotate([0.0, 0.0, -idler_offset_angle])
                translate([+gear_offsets, 0.0, -eps])
                    cylinder(d=idler_gear_shaft_baseplate_hole_diameter, h=base_plate_thickness + 2*eps);
 
        };
        
    };
    
    // Motor locator walls
    difference() {
        translate([-gear_offsets, 0.0, -motor_locator_walls_depth/2 + eps/2])
            cube([motor_linear_side_length + motor_locator_walls_side_clearance + 2*motor_locator_walls_thickness, motor_linear_side_length + motor_locator_walls_side_clearance + 2*motor_locator_walls_thickness, motor_locator_walls_depth + eps], center=true);
        
        translate([-gear_offsets, 0.0, -motor_locator_walls_depth/2 + eps/2])
            cube([motor_linear_side_length + motor_locator_walls_side_clearance, motor_linear_side_length + motor_locator_walls_side_clearance, motor_locator_walls_depth + 3*eps], center=true);
    };
}

base_plate();