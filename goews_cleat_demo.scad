/**
 * GOEWS Cleat Library Demo
 * 
 * Demonstrates all configurable options for GOEWSCleat and GOEWSBackPlate modules.
 * Each row shows a different parameter variation.
 */

include <goews_cleat.scad>

// Spacing for layout
cleat_spacing_x = 50;
cleat_spacing_y = 60;
plate_spacing_x = 120;
plate_spacing_y = 100;

// ============================================================================
// SECTION 1: GOEWSCleat() Variations
// ============================================================================

translate([0, 0, 0]) {
    text_label("GOEWSCleat() Variations", 0, -20);
    
    // Row 1: Default cleat
    translate([0, 0, 0]) {
        text_label("Default", 0, 20);
        GOEWSCleat();
    }
    
    // Row 1: Varying cleat_height
    translate([cleat_spacing_x, 0, 0]) {
        text_label("height=10", 0, 20);
        GOEWSCleat(cleat_height = 10);
    }
    
    translate([cleat_spacing_x * 2, 0, 0]) {
        text_label("height=20", 0, 20);
        GOEWSCleat(cleat_height = 20);
    }
    
    // Row 2: Varying cleat widths
    translate([0, -cleat_spacing_y, 0]) {
        text_label("base_width=12", 0, 20);
        GOEWSCleat(cleat_base_width = 12);
    }
    
    translate([cleat_spacing_x, -cleat_spacing_y, 0]) {
        text_label("base_width=18", 0, 20);
        GOEWSCleat(cleat_base_width = 18);
    }
    
    translate([cleat_spacing_x * 2, -cleat_spacing_y, 0]) {
        text_label("tip_width=20", 0, 20);
        GOEWSCleat(cleat_tip_width = 20);
    }
    
    // Row 3: Varying hook depth and thickness
    translate([0, -cleat_spacing_y * 2, 0]) {
        text_label("hook_depth=1", 0, 20);
        GOEWSCleat(cleat_hook_depth = 1);
    }
    
    translate([cleat_spacing_x, -cleat_spacing_y * 2, 0]) {
        text_label("hook_depth=4", 0, 20);
        GOEWSCleat(cleat_hook_depth = 4);
    }
    
    translate([cleat_spacing_x * 2, -cleat_spacing_y * 2, 0]) {
        text_label("thickness=8", 0, 20);
        GOEWSCleat(cleat_thickness = 8);
    }
    
    // Row 4: Varying cutout parameters
    translate([0, -cleat_spacing_y * 3, 0]) {
        text_label("cutout_r=6", 0, 20);
        GOEWSCleat(cutout_radius = 6);
    }
    
    translate([cleat_spacing_x, -cleat_spacing_y * 3, 0]) {
        text_label("cutout_r=12", 0, 20);
        GOEWSCleat(cutout_radius = 12);
    }
    
    translate([cleat_spacing_x * 2, -cleat_spacing_y * 3, 0]) {
        text_label("bottom_angle=30", 0, 20);
        GOEWSCleat(bottom_angle = 30);
    }
}

// ============================================================================
// SECTION 2: GOEWSBackPlate() Variations
// ============================================================================

translate([250, 0, 0]) {
    text_label("GOEWSBackPlate() Variations", 0, -20);
    
    // Row 1: Basic sizes
    translate([0, 0, 0]) {
        text_label("84x42 (1 cleat)", 0, 50);
        GOEWSBackPlate(plate_width = 84, plate_height = 42);
    }
    
    translate([plate_spacing_x, 0, 0]) {
        text_label("126x42 (2 cleats)", 0, 50);
        GOEWSBackPlate(plate_width = 126, plate_height = 42);
    }
    
    // Row 2: Cleat positions
    translate([0, -plate_spacing_y, 0]) {
        text_label("position=top", 0, 50);
        GOEWSBackPlate(
            plate_width = 84, 
            plate_height = 60,
            cleat_position = "top"
        );
    }
    
    translate([plate_spacing_x, -plate_spacing_y, 0]) {
        text_label("position=bottom", 0, 70);
        GOEWSBackPlate(
            plate_width = 84, 
            plate_height = 60,
            cleat_position = "bottom"
        );
    }
    
    // Row 3: Custom position and spacing
    translate([0, -plate_spacing_y * 2, 0]) {
        text_label("custom offset=30", 0, 70);
        GOEWSBackPlate(
            plate_width = 84, 
            plate_height = 60,
            cleat_position = "custom",
            cleat_custom_offset = 30
        );
    }
    
    translate([plate_spacing_x, -plate_spacing_y * 2, 0]) {
        text_label("spacing=30", 0, 50);
        GOEWSBackPlate(
            plate_width = 100, 
            plate_height = 42,
            cleat_spacing = 30
        );
    }
    
    // Row 4: Screw hole variations
    translate([0, -plate_spacing_y * 3, 0]) {
        text_label("screw_thread_r=5", 0, 50);
        GOEWSBackPlate(
            plate_width = 84, 
            plate_height = 42,
            screw_thread_radius = 5
        );
    }
    
    translate([plate_spacing_x, -plate_spacing_y * 3, 0]) {
        text_label("screw_head_r=14", 0, 50);
        GOEWSBackPlate(
            plate_width = 84, 
            plate_height = 42,
            screw_head_radius = 14,
            screw_head_depth = 5
        );
    }
    
    // Row 5: Plate thickness and edge rounding
    translate([0, -plate_spacing_y * 4, 0]) {
        text_label("thickness=10", 0, 50);
        GOEWSBackPlate(
            plate_width = 84, 
            plate_height = 42,
            plate_thickness = 10
        );
    }
    
    translate([plate_spacing_x, -plate_spacing_y * 4, 0]) {
        text_label("edge_rounding=3", 0, 50);
        GOEWSBackPlate(
            plate_width = 84, 
            plate_height = 42,
            edge_rounding = 3
        );
    }
    
    // Row 6: Custom cleat geometry on back plate
    translate([0, -plate_spacing_y * 5, 0]) {
        text_label("cleat_height=18", 0, 50);
        GOEWSBackPlate(
            plate_width = 84, 
            plate_height = 50,
            cleat_height = 18
        );
    }
    
    translate([plate_spacing_x, -plate_spacing_y * 5, 0]) {
        text_label("cleat_tip_width=22", 0, 50);
        GOEWSBackPlate(
            plate_width = 84, 
            plate_height = 42,
            cleat_tip_width = 22
        );
    }
}

// Helper module for labels
module text_label(txt, x, y) {
    color("green")
        translate([x, y, 0])
            linear_extrude(1)
                text(txt, size = 5, halign = "center", font = "Liberation Sans");
}
