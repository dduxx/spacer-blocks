include <../lib/spacer_block_generator.scad>

$fn = 100;

SPACER_X_MM = 25;
SPACER_Y_MM = 50;

RAD_MM = 1.5;

SPACER_Z_MM_AND_LABEL_SET = [
    [2, "2 mm"],
    [3, "3 mm"],
    [6, "6 mm"],
    [10, "10 mm"],
    [18, "18 mm"]
];

GAP_MM = 5;

for (i = [0 : len(SPACER_Z_MM_AND_LABEL_SET) - 1]) {
    z = SPACER_Z_MM_AND_LABEL_SET[i][0];

    label = SPACER_Z_MM_AND_LABEL_SET[i][1];

    translate([(i * SPACER_X_MM) + (i * GAP_MM), 0, 0]) {
        spacer_block([SPACER_X_MM, SPACER_Y_MM, z], RAD_MM, label);
    }
}
