include <../../dependencies/dduxx:scadUnitConversionLib:v1.0.0/scad/lib/conversion.scad>
include <../lib/spacer_block_generator.scad>

$fn = 100;

SPACER_X_INCHES = 1;
SPACER_Y_INCHES = 2;

RAD_MM = 1.5;

SPACER_Z_INCHES_AND_LABEL_SET = [
    [1/16, "1/16\""],
    [1/8, "1/8\""],
    [1/4, "1/4\""],
    [1/2, "1/2\""],
    [3/4, "3/4\""]
];

GAP_MM = 5;

for (i = [0 : len(SPACER_Z_INCHES_AND_LABEL_SET) - 1]) {
    x = inches_to_mm(SPACER_X_INCHES);
    y = inches_to_mm(SPACER_Y_INCHES);
    z = inches_to_mm(SPACER_Z_INCHES_AND_LABEL_SET[i][0]);

    label = SPACER_Z_INCHES_AND_LABEL_SET[i][1];

    translate([(i * x) + (i * GAP_MM), 0, 0]) {
        spacer_block([x, y, z], RAD_MM, label);
    }
}
