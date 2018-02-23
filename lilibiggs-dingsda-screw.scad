// Download the 'threads' module at http://dkprojects.net/openscad-threads/ and put 'threads.scad' in the same folder as this file
use <threads.scad>
$fn=100;

dapitch=5;
dadiameter=40;
dalength=15;  // quasi height

// Cap
difference () {
    cylinder (d=dadiameter, h=dalength, $fn=10);
    metric_thread (diameter=dadiameter, pitch=dapitch, length=dalength, internal=true);
 }

 
 // Cup
 translate([50,0,0]){
    metric_thread (diameter=dadiameter, pitch=dapitch, length=dalength);
 }