/* This file is created by sirOwlBeak
 *
 * Various tools for the allbot robot
*/

use <allbot_parts.scad>

include <MCAD/units.scad>

module M3HoleAndLockNutCounterSink() {
    nut_depth = M3-0.65;
    nut_radius = 3.35;
    thread_diam = M3+0.35;
    thread_height = 11;
    
    d_z = 6.0+(nut_depth);
    d_y = 5.5;
    
    difference() {
        /*translate([0,0,6]) rotate([0,-90,0])*/ ServoMount();
        
        #rotate([0,90,0]) union() {
            //translate([0, 5.5, -(0.5+nut_depth)]) {
            translate([0, d_y, -d_z]) {
                cylinder(r=nut_radius, h=nut_depth, $fn=6);
                translate([0,0,-thread_height]) cylinder(d=thread_diam, h=thread_height, $fn=25);
            }
            
            //mirror([0,1,0]) translate([0, 5.5, -(0.5+nut_depth)]) {
            mirror(Y) translate([0, d_y, -d_z]) {
                cylinder(r=nut_radius, h=nut_depth, $fn=6);
                translate([0,0,-thread_height]) cylinder(d=thread_diam, h=thread_height, $fn=25);
            }
        }
    }
}

M3HoleAndLockNutCounterSink();