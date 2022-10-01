module ring(h = 10, r1 = 20, r2 = 15) {
    difference() {
        cylinder(h, r1, r1);
        translate([0, 0, -h / 2])
            cylinder(h * 2, r2, r2);
    }
}
module arc(h = 10, th1 = 30, th2 = -30, r = 20) {
    r2 = r * 2;
    x1 = cos(th1) * r2;
    y1 = sin(th1) * r2;
    x2 = cos(th2) * r2;
    y2 = sin(th2) * r2;
    
    intersection() {
        translate([0, 0, -h / 2])
            linear_extrude(height = h * 2)
                polygon([[0,0],[x1,y1],[x2,y2]],[[2,1,0]]);
        ring(10, r, r - 4);
    }
}
module megane(r = 1) {
    scale(r) {
        translate([0, 22, -10]) {
            ring();
        }
        translate([0, -22, -10]) {
            ring();
        }
        translate([-8, 0, -10]) {
            arc();
        }
    }
}

n = 3;
for (x = [0:n]) {
    for (y = [0:n]) {
        translate([x * 25, y * 45, 0]) {
            color("red")
                megane(.5);
        }
    }
}
