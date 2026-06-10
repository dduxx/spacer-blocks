module spacer_block(
    xyz, rad, label, has_halfway_marker=true, txt_size=10, txt_height=1
) {
    assert(
        is_list(xyz) && len(xyz) == 3,
        "xyz must be a vector containing the width, depth, and height of the block");

    for (i = [0 : len(xyz) - 1]) {
        assert(is_num(xyz[i]), "vector must be made up of numbers");
    }

    assert(is_string(label), "label must be a string");

    assert(is_num(rad), "radius must be a number");

    assert(is_bool(has_halfway_marker), "has_halfway_marker must be a boolean");

    x = xyz[0];
    y = xyz[1];
    z = xyz[2];

    difference() {
        translate([rad, rad, 0]) {
            linear_extrude(z) {
                minkowski() {
                    square([x - (2 * rad), y - (2 * rad)]);

                    circle(r=rad);
                }
            }
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
