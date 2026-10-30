include <../../dependencies/BelfrySCAD:BOSL2:v2.0.779/std.scad>

module spacer_block(
    xyz,
    corners,
    label,
    has_halfway_marker=true,
    txt_size=10,
    txt_height=1,
    use_chamfer=true
) {
    assert(
        is_list(xyz) && len(xyz) == 3,
        "xyz must be a vector containing the width, depth, and height of the block");

    for (i = [0 : len(xyz) - 1]) {
        assert(is_num(xyz[i]), "vector must be made up of numbers");
    }

    assert(is_string(label), "label must be a string");

    assert(is_num(corners), "corners must be a number");

    assert(is_bool(has_halfway_marker), "has_halfway_marker must be a boolean");

    assert(is_bool(use_chamfer), "use_chamfer must be a boolean");

    x = xyz[0];
    y = xyz[1];
    z = xyz[2];

    difference() {
        if (use_chamfer) {
            cuboid(
                xyz,
                chamfer = corners,
                anchor = LEFT + FRONT + BOTTOM,
                edges = [
                    FRONT + LEFT,
                    LEFT + BACK,
                    BACK + RIGHT,
                    RIGHT + FRONT
                ]
            );
        } else {
            cuboid(
                xyz,
                rounding = corners,
                anchor = LEFT + FRONT + BOTTOM,
                edges = [
                    FRONT + LEFT,
                    LEFT + BACK,
                    BACK + RIGHT,
                    RIGHT + FRONT
                ]
            );
        }

        if(has_halfway_marker) {
            translate([0, y/2, 0]) {
                rotate([0, 0, 45]) {
                    linear_extrude(z) {
                        square([2, 2], center=true);
                    }
                }
            }

            translate([x, y/2, 0]) {
                rotate([0, 0, 45]) {
                    linear_extrude(z) {
                        square([2, 2], center=true);
                    }
                }
            }
        }


        if (len(label) > 0) {
            translate([x/2, y/2, z - txt_height]) {
                rotate([0, 0, 90]) {
                    linear_extrude(txt_height) {
                        text(label, halign="center", valign = "center", size=txt_size, font="UbuntuMono Nerd Font:style=Bold");
                    }
                }
            }
        }
    }
}
