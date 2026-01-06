/**
 * GOEWS Cleat Library
 * 
 * Parametric modules for creating GOEWS-compatible cleats and back plates.
 * 
 * Usage:
 *   include <goews_cleat.scad>
 *   
 *   GOEWSCleat();  // Single cleat with defaults
 *   GOEWSBackPlate(plate_width = 100, plate_height = 80);  // Complete back plate
 *
 * Requires: BOSL2 library
 */

include <BOSL2/std.scad>

/**
 * Parametric GOEWS Cleat Module
 * 
 * Creates a GOEWS-compatible cleat with fully configurable dimensions.
 * All parameters have sensible defaults matching the standard GOEWS spec.
 *
 * @param cleat_height        Height of the cleat extrusion (default: 13.15)
 * @param cleat_base_width    Width at base of cleat profile (default: 15.1)
 * @param cleat_tip_width     Width at tip/hook of cleat (default: 17.6)
 * @param cleat_hook_depth    Depth of the hook portion (default: 2.5)
 * @param cleat_thickness     Thickness of cleat profile (default: 5)
 * @param cutout_radius       Radius of the cylindrical cutout (default: 9.5)
 * @param cutout_depth        Depth of the cylindrical cutout (default: 6)
 * @param cutout_z_offset     Z offset for the cutout cylinder (default: 2.964)
 * @param bottom_angle        Angle for the bottom slice (default: 45)
 * @param fn                  Fragment count for cylinders (default: 256)
 */
module GOEWSCleat(
    cleat_height = 13.15,
    cleat_base_width = 15.1,
    cleat_tip_width = 17.6,
    cleat_hook_depth = 2.5,
    cleat_thickness = 5,
    cutout_radius = 9.5,
    cutout_depth = 6,
    cutout_z_offset = 2.964,
    bottom_angle = 45,
    fn = 256
) {
    // Calculate derived values
    full_width = cleat_tip_width * 2;
    
    difference() {
        // main profile
        rotate(a = [180,0,0])
            linear_extrude(height = cleat_height)
                let (cleatProfile = [
                    [0, 0],
                    [cleat_base_width, 0],
                    [cleat_tip_width, cleat_hook_depth],
                    [cleat_base_width, cleat_thickness],
                    [0, cleat_thickness]
                ])
                union(){
                    polygon(points = cleatProfile);
                    mirror([1,0,0])
                        polygon(points = cleatProfile);
                };
        // angled slice off bottom
        translate([-cleat_tip_width, -8, -cleat_height * 2])
            rotate([bottom_angle, 0, 0])
                translate([0, cleat_thickness, 0])
                    cube([full_width, 10, 15]);
        // cutout
        translate([0, -0.005, cutout_z_offset])
            rotate([90, 0, 0])
                cylinder(h = cutout_depth, r = cutout_radius, $fn = fn);
    }
}

/**
 * GOEWS Back Plate with Cleats
 * 
 * Creates a complete back plate with GOEWS cleats and screw access holes.
 *
 * @param plate_width              Width of the back plate
 * @param plate_height             Height of the back plate
 * @param plate_thickness          Thickness of the back plate (default: 7)
 * @param cleat_spacing            Distance between cleat centers (default: 42)
 * @param cleat_position           Position mode: "normal", "top", "bottom", "custom" (default: "normal")
 * @param cleat_custom_offset      Custom offset from top when cleat_position="custom" (default: 11.24)
 * @param screw_thread_radius      Radius of screw thread clearance hole (default: 7)
 * @param screw_head_radius        Radius of screw head counterbore (default: 10)
 * @param screw_head_depth         Depth of screw head counterbore (default: 4)
 * @param edge_rounding            Rounding for plate edges (default: 0.5)
 * @param subtracted_slots         Number of slots to subtract from calculated count (default: 0)
 * @param cleat_height             Height of cleat extrusion (default: 13.15)
 * @param cleat_base_width         Width at base of cleat (default: 15.1)
 * @param cleat_tip_width          Width at tip of cleat (default: 17.6)
 * @param cleat_hook_depth         Depth of cleat hook (default: 2.5)
 * @param cleat_thickness          Thickness of cleat (default: 5)
 * @param cleat_cutout_radius      Radius of cleat cutout (default: 9.5)
 * @param fn                       Fragment count for cylinders (default: 256)
 */
module GOEWSBackPlate(
    plate_width,
    plate_height,
    plate_thickness = 7,
    cleat_spacing = 42,
    cleat_position = "normal",
    cleat_custom_offset = 11.24,
    screw_thread_radius = 7,
    screw_head_radius = 10,
    screw_head_depth = 4,
    edge_rounding = 0.5,
    subtracted_slots = 0,
    cleat_height = 13.15,
    cleat_base_width = 15.1,
    cleat_tip_width = 17.6,
    cleat_hook_depth = 2.5,
    cleat_thickness = 5,
    cleat_cutout_radius = 9.5,
    fn = 256
) {
    // Calculate cleat offset from top based on position mode
    offset_from_top = 
        (cleat_position == "normal") ? 11.24 :
        (cleat_position == "top") ? 0 :
        (cleat_position == "bottom") ? plate_height - cleat_height :
        cleat_custom_offset;  // custom
    
    // Ensure minimum dimensions
    actual_width = max(plate_width, cleat_spacing);
    actual_height = max(plate_height, 25);
    
    // Calculate slot count
    slot_count = floor(actual_width / cleat_spacing) - subtracted_slots;
    
    difference() {
        union() {
            // Back plate
            translate([0, -plate_thickness, 0])
                cuboid(
                    size = [actual_width, plate_thickness, actual_height],
                    rounding = edge_rounding,
                    except_edges = BACK,
                    anchor = FRONT+LEFT+BOT
                );
            
            // Add cleats
            for (slotNum = [0:1:slot_count-1]) {
                translate([
                    cleat_spacing/2 + (actual_width/cleat_spacing - slot_count) * cleat_spacing/2 + slotNum * cleat_spacing,
                    -plate_thickness,
                    actual_height - offset_from_top
                ]) {
                    GOEWSCleat(
                        cleat_height = cleat_height,
                        cleat_base_width = cleat_base_width,
                        cleat_tip_width = cleat_tip_width,
                        cleat_hook_depth = cleat_hook_depth,
                        cleat_thickness = cleat_thickness,
                        cutout_radius = cleat_cutout_radius,
                        fn = fn
                    );
                }
            }
        }
        
        // Remove back plate cutouts for screw threads
        for (slotNum = [0:1:slot_count-1]) {
            translate([
                cleat_spacing/2 + (actual_width/cleat_spacing - slot_count) * cleat_spacing/2 + slotNum * cleat_spacing,
                0,
                actual_height + 0.46 - offset_from_top + 11.24
            ]) {
                rotate([90, 0, 0])
                    cylinder(h = plate_thickness + 0.1, r = screw_thread_radius, $fn = fn);
            }
        }
        
        // Remove back plate cutouts for screw heads
        for (slotNum = [0:1:slot_count-1]) {
            translate([
                cleat_spacing/2 + (actual_width/cleat_spacing - slot_count) * cleat_spacing/2 + slotNum * cleat_spacing,
                -screw_head_depth,
                actual_height + 0.46 - offset_from_top + 11.24
            ]) {
                rotate([-90, 0, 0])
                    cylinder(h = screw_head_depth + 0.1, r = screw_head_radius, $fn = fn);
            }
        }
    }
}

//Legacy wrapper for backwards compatibility
module GOEWSCleatTool(totalHeight) {
    GOEWSCleat();
}
