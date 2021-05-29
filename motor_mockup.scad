include <params.scad>

module motor_mockup() {
    
    translate([0.0, 0.0, -motor_body_height/2])
        cube([motor_linear_side_length, motor_linear_side_length, motor_body_height], center=true);
    
    // Locator ring
    translate([0.0, 0.0, -eps])
        cylinder(d=motor_centre_circle_diameter, h=motor_centre_circle_depth+eps);
    
    // Shaft
    translate([0.0, 0.0, motor_centre_circle_depth-eps])
        cylinder(d=motor_shaft_diameter, h=motor_shaft_length+eps);
    
};

motor_mockup();