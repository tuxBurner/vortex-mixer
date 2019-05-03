include <nuts_and_bolts.scad>

/**
* Size of the bolts
*/
boltSize=4;
boltTolerance=0.2;
boltFlesh=3;

bottomHeight = boltSize + boltTolerance + boltFlesh + METRIC_NUT_THICKNESS[boltSize] + boltTolerance;

wallThickness=2;

$fn=100;

/**
* Top configurations
*/
topConfigurations = [
  [10, 24.5], // normal vallejo top
  [10, 35], // vallejo big top
  [10,32], // games workshop 
  [10,36,6] // games workshop old
];



/**
* Module for creating a top
*/
module top(height, dia, fn=100) {
  
  union() {
    difference() {
      cylinder(d=dia+2*wallThickness, h=bottomHeight, center=false);
      translate([0, 0, bottomHeight - boltSize - boltTolerance]) {
        rotate([0, 180, 0]) {
          #boltHole(size=boltSize,length=bottomHeight, tolerance=boltTolerance);  
        }  
      }
      nutHole(size=boltSize,tolerance=boltTolerance);    
    }
  
    translate([0, 0, bottomHeight]) {
      difference() {
        cylinder(d=dia+2*wallThickness, h=height, center=false);
        cylinder(d=dia, h=height, center=false,$fn=fn);
      }
    }
  }
}


/**
* Iterate over the tops and draw them
*/
for(idx = [0:len(topConfigurations)-1])  {  
  xOffset = sumv(topConfigurations,idx,0);
  translate([xOffset,0,0]) {
    fn = (len(topConfigurations[idx]) == 2) ? 100 : topConfigurations[idx][2];     
    top(height = topConfigurations[idx][0], dia = topConfigurations[idx][1], fn = fn);
  }
}

/**
* Used to calculate the sum of all dias from to
*/
function sumv(v,i,s=0) = (i==s ? v[i][1]+10 : v[i][1]+10 + sumv(v,i-1,s));



