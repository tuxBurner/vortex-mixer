use <boxes.scad>
include <nuts_and_bolts.scad>

/**
* Motor dimensions
*/
motorDia=28;
motorHeight=50;
motorShaftDia=3;
motorShaftLength=5;

/**
* Case dimensions
*/
caseWidth=95;
caseDepth=80;
caseHeight=motorHeight;
caseCornerRadius=5;

// thickness of the wall of the case
caseWallThickness=2;

/**
* Calculate the case real dimensions
*/
outerCaseWidth = caseWidth+2*caseWallThickness;
outerCaseDepth = caseDepth+2*caseWallThickness;
outerCaseHeight = caseHeight+caseWallThickness;

/**
* Case Lid dimensions
*/
caseLidLidHeight=2;
caseLidHeight=caseLidLidHeight*2;
caseLidTolerance=1;
caseLidScrewDia=2.5;

/**
* Prim for fixiatet the lid to the case
*/
caseLidFixPrismWidth=15;
caseLidFixPrismDepth=15;
caseLidFixPrismHeight=15;

/**
* Motor clamp dimensions
*/
motorClampHeight=10;
motorClampFlesh=5;
motorClampWidth=motorClampFlesh * 2 + motorDia;
motorClampLength = caseDepth - 2;
motorClampBoltSize=3;
motorClampNutHeight=motorClampWidth / 5;
motorClampTolerance=3;
motorClampLidLength=caseDepth / 8;
motorClampFixHeight=3;
motorClampFixWidth=15;
motorClampFixTolerance=1;
motorClampWedgeHeight=2;

motorClampCaseFixHeight =  caseHeight / 2;
motorClampCaseFixDepth = motorClampFixWidth / 2;

/**
* Motor clamp variables where to put the screws for the motorclamp and the case
*/
motorClampFixScrewDia = 2.5;
motorClampFixScrewHeight = 10;
motorClampFixScrewTolerance = 5 + motorClampFixScrewDia;
motorClampFixScrewPositions=[
  [motorClampFixScrewTolerance, motorClampCaseFixDepth / 2],
  [motorClampWidth / 2, motorClampCaseFixDepth / 2],
  [motorClampWidth - motorClampFixScrewTolerance, motorClampCaseFixDepth / 2],
];

/**
* Dimensions where to put the micro switch at
*/
microSwitchCaseFixHeight = motorClampCaseFixHeight - 2;
microSwitchCaseFixDepth = motorClampCaseFixDepth;


/**
* For debug purpose the pcb 
*/
pcbXTollerance=1;
pcbWidth=24;
pcbDepth=33;
pcbHeight=24;

/**
* Poti dimensions
*/
potiHoleDia=7;
potiHoleXOffset=8;
potiHolezOffset=17;

/**
* Diameter for the power cable
*/
cableHoleDia=4;

/**
* Coupler dimensions
*/
couplerDia=15;
couplerHeight=15;
couplerScrewDia=4.2;
couplerBearingDia=8;
couplerBearingHeight=3;
couplerMoterShaftDia=2.4;
couplerBearingOffset=2.5;


$fn=100;


$previewMotor=false;
$debugLid=false;
$debugMotorClamp=false;



/**
* Generates the bottom of the case
*/
module bottomCase() {  
  union() {
    translate([outerCaseWidth / 2, outerCaseDepth / 2, outerCaseHeight / 2]) {
      difference() {  
        roundedBox([outerCaseWidth, outerCaseDepth, outerCaseHeight], caseCornerRadius, true);
        translate([0, 0, caseWallThickness]) {
          roundedBox([caseWidth, caseDepth, caseHeight], caseCornerRadius, true);
        }
      }
    }

    translate([0, 0, outerCaseHeight -caseLidFixPrismHeight-caseLidLidHeight]) {
      translate([0, (outerCaseDepth - caseLidFixPrismWidth) / 2, 0]) {
        lidHolder(caseLidFixPrismWidth, caseLidFixPrismHeight, caseLidFixPrismDepth);  
      }
      translate([outerCaseWidth , (outerCaseDepth + caseLidFixPrismWidth) / 2, 0]) {
        rotate([0, 0, 180]) {      
          lidHolder(caseLidFixPrismWidth, caseLidFixPrismHeight, caseLidFixPrismDepth);  
        }
      }
      translate([(outerCaseWidth + caseLidFixPrismWidth) / 2 ,0, 0]) {
        rotate([0, 0, 90]) {      
         // #lidHolder(caseLidFixPrismWidth, caseLidFixPrismHeight, caseLidFixPrismDepth);  
        }
      }
      translate([(outerCaseWidth - caseLidFixPrismWidth) / 2 ,outerCaseDepth, 0]) {
        rotate([0, 0, -90]) {      
          //lidHolder(caseLidFixPrismWidth, caseLidFixPrismHeight, caseLidFixPrismDepth);  
        }
      }
    }
  
    translate([(outerCaseWidth - motorClampWidth) / 2 , caseWallThickness,caseWallThickness]) {    
      motorClampCaseFixiation();    
      translate([0,caseDepth - microSwitchCaseFixDepth, 0]) {
        microSwitchHolder();  
      }
    }
  }
}

/**
* Draws the motor clamp
*/
module motorClamp() {
  color("DarkKhaki") {
    difference() {
      cube(size=[motorClampWidth, motorClampLength, motorClampHeight], center=false);
      
      // cut out the fixiation which is thinner so we can bend it down
      translate([0, 0, motorClampFixHeight]) {
        cube(size=[motorClampWidth, motorClampFixWidth,motorClampHeight- motorClampFixHeight], center=false);  
      }

      // cut off the tolerance      
      cube(size=[motorClampWidth, motorClampFixTolerance, motorClampFixHeight], center=false);
      

      // cut out the screwholes
      clampScrewHoles(motorClampFixHeight);
   
      // cut out the motor
      translate([motorClampWidth / 2, caseDepth / 2, 0]) {
        cylinder(d=motorDia, h=motorClampHeight, center=false);  
      }

      // cut out the tolerance slit 
      motorClampLidOffset = (caseDepth + motorDia) / 2 -0.5;
      translate([(motorClampWidth - motorClampTolerance) / 2,motorClampLidOffset , 0]) {
        cube(size=[motorClampTolerance, motorClampLidLength, motorClampHeight], center=false);  
        translate([0, motorClampLidLength, 0]) {
          cube(size=[motorClampWidth - motorClampTolerance, motorClampTolerance, motorClampHeight], center=false);  
        }
      } 
      
      // add the hole for the fixiation screw
      translate([motorClampWidth - motorClampBoltSize , (motorClampLength - motorClampBoltSize * 2 - (motorClampLength / 2 - motorDia / 2 - motorClampLidLength)), motorClampHeight  / 2]) { 
        rotate([0, 270, 0]) {
          boltHole(motorClampBoltSize, length= motorClampWidth-motorClampBoltSize, proj=-1);  
        }        
      } 

      // add a nut hole 
      translate([motorClampNutHeight, (motorClampLength - motorClampBoltSize * 2 - (motorClampLength / 2 - motorDia / 2 - motorClampLidLength)), motorClampHeight  / 2]) {         
        rotate([0, 270, 0]) {
          cylinder(r= METRIC_NUT_AC_WIDTHS[motorClampBoltSize]/2+0.5, h=motorClampNutHeight, $fn = 6, center=[0,0]);
        }
      }

      // slim the end of the clamp 
      backCutOffOffset = motorClampLidOffset + motorClampLidLength + motorClampTolerance;
      translate([0, backCutOffOffset, motorClampFixHeight]) {
        cube(size=[motorClampWidth, motorClampLength - backCutOffOffset, motorClampHeight- motorClampFixHeight], center=false);
      }
    }
  }
}

/**
* Cut out the screwholes for fix the clamp
*/ 
module clampScrewHoles(holesHeight) {
  for(screwPos = motorClampFixScrewPositions) {
    translate([screwPos[0], screwPos[1], 0]) {
      cylinder(d=motorClampFixScrewDia, h=holesHeight, center=false);  
    }
  }
}

/**
* Draws the clamp case motor fixiation
*/
module motorClampCaseFixiation() {
  color("Teal") {
    difference() {
      cube(size=[motorClampWidth, motorClampCaseFixDepth, motorClampCaseFixHeight], center=false);
      translate([0, 0, motorClampCaseFixHeight - motorClampFixScrewHeight]) {
        clampScrewHoles(motorClampFixScrewHeight); 
      }    
    }
  }
}

/**
* Draws the holder for the microswitch
*/
module microSwitchHolder() {
  color("Gainsboro") {
    difference() {
      cube(size=[motorClampWidth, microSwitchCaseFixDepth, microSwitchCaseFixHeight], center=false);      
    }
  }
}

/**
* Draws the lid
*/
module lid() {
  translate([outerCaseWidth / 2, outerCaseDepth / 2, 0]) {
    difference() {
      union() {
        roundedBox([outerCaseWidth, outerCaseDepth, caseLidHeight - caseLidLidHeight], caseCornerRadius, true);
        translate([0, 0, caseLidLidHeight]) {
          roundedBox([caseWidth - caseLidTolerance, caseDepth- caseLidTolerance, caseLidLidHeight], caseCornerRadius, true);
        }
      }
  
      translate([0, 0, -1 * (caseLidLidHeight / 2)]) {
        cylinder(d=motorDia + caseLidTolerance, h=caseLidHeight, center=false);  
        
        translate([(outerCaseWidth - caseLidFixPrismDepth) / 2, 0, 0]) {
          cylinder(d=caseLidScrewDia, h=caseLidHeight, center=false);  
        }

        translate([-1*(outerCaseWidth - caseLidFixPrismDepth) / 2, 0, 0]) {
          cylinder(d=caseLidScrewDia, h=caseLidHeight, center=false);  
        }

        translate([0,-1*(outerCaseDepth - caseLidFixPrismDepth) / 2, 0]) {
         // cylinder(d=caseLidScrewDia, h=caseLidHeight, center=false);  
        }

        translate([0,(outerCaseDepth - caseLidFixPrismDepth) / 2, 0]) {
          //cylinder(d=caseLidScrewDia, h=caseLidHeight, center=false);  
        }
        
      }
    }
  }
}

/**
* In preview mode this is drawn to check if the pcb fits into the case
*/
module pcbPreview() {
  color("Red") {
    translate([caseWallThickness + pcbXTollerance, caseWallThickness, caseWallThickness]) {
     cube(size=[pcbWidth, pcbDepth, pcbHeight], center=false);   
    }    
  }
}

/**
* Creates the hole for the poti
*/
module pcbPotiHole() {
  translate([potiHoleDia / 2 + caseWallThickness + pcbXTollerance + potiHoleXOffset, caseWallThickness, potiHoleDia / 2 + caseWallThickness + potiHolezOffset]) {
    rotate([90, 0, 0]) {
       cylinder(d=potiHoleDia, h=caseWallThickness, center=false);   
    }  
  }
}

/**
* Creates the hole for the cable
*/
module cableHole() {
  translate([cableHoleDia / 2 + caseWallThickness + pcbXTollerance + potiHoleXOffset,  caseDepth + caseWallThickness * 2, cableHoleDia  + caseWallThickness]) {
    rotate([90, 0, 0]) {
       cylinder(d=cableHoleDia, h=caseWallThickness, center=false);   
    }  
  }
}

/**
* Is only rendered when in preview mode
*/
module motorPreview() {
  if ($preview && $previewMotor) {    
    translate([outerCaseWidth / 2,outerCaseDepth / 2, caseWallThickness]) {
      color("DarkGray") {
        cylinder(d=motorDia, h=motorHeight, center=false);
        translate([0, 0, motorHeight]) {
           cylinder(d=motorShaftDia, h=motorShaftLength, center=false); 
        }
      }
    }
  }
}

/**
* Holder for the lid
*/
module lidHolder(l, w, h){
  difference() {
    rotate([0, 90, 0])  {
      rotate([0, 0, 90]) {
        polyhedron(
          points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
          faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
        );
      }
    }
    
    translate([h / 2, l / 2, 0]) {        
      cylinder(d=caseLidScrewDia, h=w, center=false);         
    }       
  }
}

/**
* Motor Clamp Wedge
*/
module motorClampHolderWedge() {
  l=motorClampWidth;
  //w=motorClampFixWidth;
  w=motorClampCaseFixDepth;
  h=motorClampWedgeHeight;
  difference() {
    polyhedron(
      points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
      faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
    clampScrewHoles(motorClampWedgeHeight);
  }
}


/**
* The coupler for the motor
*/
module coupler() {
  difference() {
    cylinder(d=couplerDia, h=couplerHeight, center=false);
    cylinder(d=couplerMoterShaftDia, h=couplerHeight/2, center=false); 

    translate([couplerBearingOffset, 0, couplerHeight/2]) {
      cylinder(d=couplerScrewDia, h=couplerHeight/2, center=false);
      translate([0, 0, couplerHeight/2-couplerBearingHeight]) {
        cylinder(d=couplerBearingDia, h=couplerBearingHeight, center=false);
      }
    }


  }
}

/**
* Draws the complete bottom case with the cable and poti hole
*/
module completeBottomCase() {
  difference() {
    union() {
      bottomCase();
      if($preview) {
        pcbPreview();
      }
    }
    
    pcbPotiHole();
    cableHole();
  }
}

completeBottomCase();



if($debugMotorClamp) {
  translate([(outerCaseWidth - motorClampWidth) / 2 , caseWallThickness, outerCaseHeight / 2]) {    
    motorClamp();    
  }
} else {
  translate([outerCaseWidth + 10, 0, 0]) {
    motorClamp();  
  }  
}

translate([outerCaseWidth + motorClampWidth + 20 , 0, 0]) {
  motorClampHolderWedge();
  translate([0, 40, 0]) {
    coupler();
  }
}


if($debugLid) {
  translate([0, outerCaseWidth, outerCaseHeight]) {
    rotate([180, 0, 0]) {
      lid();      
    }
  }
} else {
  translate([-1*outerCaseWidth - 10, 0, 0]) {
    lid();
  }
}

motorPreview();  






