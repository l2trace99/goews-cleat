# GOEWS Cleat Library for OpenSCAD

A parametric OpenSCAD library for creating GOEWS (Grid Organized Easy Wall System) compatible cleats and back plates.

<img width="817" height="581" alt="image" src="https://github.com/user-attachments/assets/694f14f8-8941-4bca-a2d3-0b3993663dc4" />


## Origin

This library is shamelessly ripped from the [GOEWS Vertical Item Holder](https://makerworld.com/en/makerlab/parametricModelMaker?designId=993886&from=model_page&modelName=GOEWSVerticalItemHolder.scad&scadUrl=https%3A%2F%2Fmakerworld.bblmw.com%2Fmakerworld%2Fmodel%2FUSd50300edeee6ae%2Fmsfile%2F2025-01-17_03d0d385edbd9.scad%3Fat%3D1767663147%26exp%3D1767663447%26key%3D7c0031f1cee4cd55c4be26bb3a4bb50f%26uid%3D972012816&unikey=aab4ec2c-a888-457a-b7c9-1de63cbd9538) on MakerWorld.

The original code was created by Andy Levesque and is part of the parametric GOEWS ecosystem. The cleat geometry and mounting logic have been extracted into a standalone, reusable library with fully parametric modules.

## Requirements

- [OpenSCAD](https://openscad.org/)
- [BOSL2 Library](https://github.com/BelfrySCAD/BOSL2)

## Installation

1. Clone or download this repository
2. Ensure BOSL2 is installed in your OpenSCAD libraries folder
3. Include the library in your project:

```openscad
include <goews_cleat.scad>
```

## Usage

### Single Cleat

```openscad
include <goews_cleat.scad>

// Default cleat
GOEWSCleat();

// Custom cleat
GOEWSCleat(
    cleat_height = 15,
    cleat_tip_width = 20,
    cleat_hook_depth = 3
);
```

### Complete Back Plate with Cleats

```openscad
include <goews_cleat.scad>

// Basic back plate
GOEWSBackPlate(plate_width = 84, plate_height = 42);

// Back plate with custom options
GOEWSBackPlate(
    plate_width = 126,
    plate_height = 60,
    cleat_position = "bottom",
    cleat_spacing = 42,
    screw_head_radius = 12
);
```

## API Reference

### GOEWSCleat()

Creates a single GOEWS-compatible cleat.

| Parameter | Default | Description |
|-----------|---------|-------------|
| `cleat_height` | 13.15 | Height of cleat extrusion |
| `cleat_base_width` | 15.1 | Width at base of profile |
| `cleat_tip_width` | 17.6 | Width at tip/hook |
| `cleat_hook_depth` | 2.5 | Depth of hook portion |
| `cleat_thickness` | 5 | Thickness of profile |
| `cutout_radius` | 9.5 | Cylindrical cutout radius |
| `cutout_depth` | 6 | Cutout depth |
| `cutout_z_offset` | 2.964 | Z offset for cutout |
| `bottom_angle` | 45 | Angle for bottom slice |
| `fn` | 256 | Fragment count for cylinders |

### GOEWSBackPlate()

Creates a complete back plate with cleats and screw access holes.

| Parameter | Default | Description |
|-----------|---------|-------------|
| `plate_width` | *required* | Width of the back plate |
| `plate_height` | *required* | Height of the back plate |
| `plate_thickness` | 7 | Thickness of the plate |
| `cleat_spacing` | 42 | Distance between cleat centers |
| `cleat_position` | "normal" | Position mode: "normal", "top", "bottom", "custom" |
| `cleat_custom_offset` | 11.24 | Custom offset from top (when position="custom") |
| `screw_thread_radius` | 7 | Radius of screw clearance hole |
| `screw_head_radius` | 10 | Radius of screw head counterbore |
| `screw_head_depth` | 4 | Depth of screw head counterbore |
| `edge_rounding` | 0.5 | Edge rounding for plate |
| `subtracted_slots` | 0 | Number of slots to subtract from calculated count |
| `cleat_height` | 13.15 | Height of cleat extrusion |
| `cleat_base_width` | 15.1 | Width at base of cleat |
| `cleat_tip_width` | 17.6 | Width at tip of cleat |
| `cleat_hook_depth` | 2.5 | Depth of cleat hook |
| `cleat_thickness` | 5 | Thickness of cleat |
| `cleat_cutout_radius` | 9.5 | Radius of cleat cutout |
| `fn` | 256 | Fragment count for cylinders |

## Demo

See `goews_cleat_demo.scad` for a visual demonstration of all available options.

## Files

- `goews_cleat.scad` - The main library file
- `goews_cleat_demo.scad` - Visual demo of all parameters
- `parametric_goews.scad` - Original full item holder (uses this library)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

- Original design by **Andy Levesque**
- GOEWS cleat system
- [BOSL2 Library](https://github.com/BelfrySCAD/BOSL2) by Belfry OpenSCAD Library
