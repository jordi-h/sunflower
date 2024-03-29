PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//240733/861873/2.49/40/4/Integrated Circuit

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "c118.42_h78.42"
		(holeDiam 0.7842)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 1.1842) (shapeHeight 1.1842))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 1.1842) (shapeHeight 1.1842))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "PIC16F1789-I_P" (originalName "PIC16F1789-I_P")
		(multiLayer
			(pad (padNum 1) (padStyleRef c118.42_h78.42) (pt 0, 0) (rotation 90))
			(pad (padNum 2) (padStyleRef c118.42_h78.42) (pt 2.54, 0) (rotation 90))
			(pad (padNum 3) (padStyleRef c118.42_h78.42) (pt 5.08, 0) (rotation 90))
			(pad (padNum 4) (padStyleRef c118.42_h78.42) (pt 7.62, 0) (rotation 90))
			(pad (padNum 5) (padStyleRef c118.42_h78.42) (pt 10.16, 0) (rotation 90))
			(pad (padNum 6) (padStyleRef c118.42_h78.42) (pt 12.7, 0) (rotation 90))
			(pad (padNum 7) (padStyleRef c118.42_h78.42) (pt 15.24, 0) (rotation 90))
			(pad (padNum 8) (padStyleRef c118.42_h78.42) (pt 17.78, 0) (rotation 90))
			(pad (padNum 9) (padStyleRef c118.42_h78.42) (pt 20.32, 0) (rotation 90))
			(pad (padNum 10) (padStyleRef c118.42_h78.42) (pt 22.86, 0) (rotation 90))
			(pad (padNum 11) (padStyleRef c118.42_h78.42) (pt 25.4, 0) (rotation 90))
			(pad (padNum 12) (padStyleRef c118.42_h78.42) (pt 27.94, 0) (rotation 90))
			(pad (padNum 13) (padStyleRef c118.42_h78.42) (pt 30.48, 0) (rotation 90))
			(pad (padNum 14) (padStyleRef c118.42_h78.42) (pt 33.02, 0) (rotation 90))
			(pad (padNum 15) (padStyleRef c118.42_h78.42) (pt 35.56, 0) (rotation 90))
			(pad (padNum 16) (padStyleRef c118.42_h78.42) (pt 38.1, 0) (rotation 90))
			(pad (padNum 17) (padStyleRef c118.42_h78.42) (pt 40.64, 0) (rotation 90))
			(pad (padNum 18) (padStyleRef c118.42_h78.42) (pt 43.18, 0) (rotation 90))
			(pad (padNum 19) (padStyleRef c118.42_h78.42) (pt 45.72, 0) (rotation 90))
			(pad (padNum 20) (padStyleRef c118.42_h78.42) (pt 48.26, 0) (rotation 90))
			(pad (padNum 21) (padStyleRef c118.42_h78.42) (pt 48.26, 15.43) (rotation 90))
			(pad (padNum 22) (padStyleRef c118.42_h78.42) (pt 45.72, 15.43) (rotation 90))
			(pad (padNum 23) (padStyleRef c118.42_h78.42) (pt 43.18, 15.43) (rotation 90))
			(pad (padNum 24) (padStyleRef c118.42_h78.42) (pt 40.64, 15.43) (rotation 90))
			(pad (padNum 25) (padStyleRef c118.42_h78.42) (pt 38.1, 15.43) (rotation 90))
			(pad (padNum 26) (padStyleRef c118.42_h78.42) (pt 35.56, 15.43) (rotation 90))
			(pad (padNum 27) (padStyleRef c118.42_h78.42) (pt 33.02, 15.43) (rotation 90))
			(pad (padNum 28) (padStyleRef c118.42_h78.42) (pt 30.48, 15.43) (rotation 90))
			(pad (padNum 29) (padStyleRef c118.42_h78.42) (pt 27.94, 15.43) (rotation 90))
			(pad (padNum 30) (padStyleRef c118.42_h78.42) (pt 25.4, 15.43) (rotation 90))
			(pad (padNum 31) (padStyleRef c118.42_h78.42) (pt 22.86, 15.43) (rotation 90))
			(pad (padNum 32) (padStyleRef c118.42_h78.42) (pt 20.32, 15.43) (rotation 90))
			(pad (padNum 33) (padStyleRef c118.42_h78.42) (pt 17.78, 15.43) (rotation 90))
			(pad (padNum 34) (padStyleRef c118.42_h78.42) (pt 15.24, 15.43) (rotation 90))
			(pad (padNum 35) (padStyleRef c118.42_h78.42) (pt 12.7, 15.43) (rotation 90))
			(pad (padNum 36) (padStyleRef c118.42_h78.42) (pt 10.16, 15.43) (rotation 90))
			(pad (padNum 37) (padStyleRef c118.42_h78.42) (pt 7.62, 15.43) (rotation 90))
			(pad (padNum 38) (padStyleRef c118.42_h78.42) (pt 5.08, 15.43) (rotation 90))
			(pad (padNum 39) (padStyleRef c118.42_h78.42) (pt 2.54, 15.43) (rotation 90))
			(pad (padNum 40) (padStyleRef c118.42_h78.42) (pt 0, 15.43) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.746 14.478) (pt -1.746 0.953) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.746 0.953) (pt 50.006 0.953) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 50.006 0.953) (pt 50.006 14.478) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 50.006 14.478) (pt -1.746 14.478) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.746 14.478) (pt -1.746 0.953) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.746 0.953) (pt 50.006 0.953) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 50.006 0.953) (pt 50.006 14.478) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 50.006 14.478) (pt -1.746 14.478) (width 0.1))
		)
	)
	(symbolDef "PIC16F1789-I_P" (originalName "PIC16F1789-I_P")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 3) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -225 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 4) (pt 0 mils -300 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -325 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 5) (pt 0 mils -400 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -425 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 6) (pt 0 mils -500 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -525 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 7) (pt 0 mils -600 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -625 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 8) (pt 0 mils -700 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -725 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 9) (pt 0 mils -800 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -825 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 10) (pt 0 mils -900 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -925 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 11) (pt 0 mils -1000 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -1025 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 12) (pt 0 mils -1100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -1125 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 13) (pt 0 mils -1200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -1225 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 14) (pt 0 mils -1300 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -1325 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 15) (pt 0 mils -1400 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -1425 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 16) (pt 0 mils -1500 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -1525 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 17) (pt 0 mils -1600 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -1625 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 18) (pt 0 mils -1700 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -1725 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 19) (pt 0 mils -1800 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -1825 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 20) (pt 0 mils -1900 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -1925 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 21) (pt 1900 mils -1900 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -1925 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 22) (pt 1900 mils -1800 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -1825 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 23) (pt 1900 mils -1700 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -1725 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 24) (pt 1900 mils -1600 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -1625 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 25) (pt 1900 mils -1500 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -1525 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 26) (pt 1900 mils -1400 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -1425 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 27) (pt 1900 mils -1300 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -1325 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 28) (pt 1900 mils -1200 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -1225 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 29) (pt 1900 mils -1100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -1125 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 30) (pt 1900 mils -1000 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -1025 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 31) (pt 1900 mils -900 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -925 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 32) (pt 1900 mils -800 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -825 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 33) (pt 1900 mils -700 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -725 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 34) (pt 1900 mils -600 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -625 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 35) (pt 1900 mils -500 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -525 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 36) (pt 1900 mils -400 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -425 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 37) (pt 1900 mils -300 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -325 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 38) (pt 1900 mils -200 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -225 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 39) (pt 1900 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -125 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 40) (pt 1900 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1670 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 1700 mils 100 mils) (width 6 mils))
		(line (pt 1700 mils 100 mils) (pt 1700 mils -2000 mils) (width 6 mils))
		(line (pt 1700 mils -2000 mils) (pt 200 mils -2000 mils) (width 6 mils))
		(line (pt 200 mils -2000 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 1750 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 1750 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "PIC16F1789-I_P" (originalName "PIC16F1789-I_P") (compHeader (numPins 40) (numParts 1) (refDesPrefix IC)
		)
		(compPin "1" (pinName "VPP/__MCLR__/RE3") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "RAO") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "3" (pinName "RA1") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "4" (pinName "RA2") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "5" (pinName "RA3") (partNum 1) (symPinNum 5) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "6" (pinName "RA4") (partNum 1) (symPinNum 6) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "7" (pinName "RA5") (partNum 1) (symPinNum 7) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "8" (pinName "REO") (partNum 1) (symPinNum 8) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "9" (pinName "RE1") (partNum 1) (symPinNum 9) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "10" (pinName "RE2") (partNum 1) (symPinNum 10) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "11" (pinName "VDD_1") (partNum 1) (symPinNum 11) (gateEq 0) (pinEq 0) (pinType Power))
		(compPin "12" (pinName "VSS_1") (partNum 1) (symPinNum 12) (gateEq 0) (pinEq 0) (pinType Power))
		(compPin "13" (pinName "RA7") (partNum 1) (symPinNum 13) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "14" (pinName "RA6") (partNum 1) (symPinNum 14) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "15" (pinName "RCO") (partNum 1) (symPinNum 15) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "16" (pinName "RC1") (partNum 1) (symPinNum 16) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "17" (pinName "RC2") (partNum 1) (symPinNum 17) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "18" (pinName "RC3") (partNum 1) (symPinNum 18) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "19" (pinName "RDO") (partNum 1) (symPinNum 19) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "20" (pinName "RD1") (partNum 1) (symPinNum 20) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "21" (pinName "RD2") (partNum 1) (symPinNum 21) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "22" (pinName "RD3") (partNum 1) (symPinNum 22) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "23" (pinName "RC4") (partNum 1) (symPinNum 23) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "24" (pinName "RC5") (partNum 1) (symPinNum 24) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "25" (pinName "RC6") (partNum 1) (symPinNum 25) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "26" (pinName "RC7") (partNum 1) (symPinNum 26) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "27" (pinName "RD4") (partNum 1) (symPinNum 27) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "28" (pinName "RD5") (partNum 1) (symPinNum 28) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "29" (pinName "RD6") (partNum 1) (symPinNum 29) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "30" (pinName "RD7") (partNum 1) (symPinNum 30) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "31" (pinName "VSS_2") (partNum 1) (symPinNum 31) (gateEq 0) (pinEq 0) (pinType Power))
		(compPin "32" (pinName "VDD_2") (partNum 1) (symPinNum 32) (gateEq 0) (pinEq 0) (pinType Power))
		(compPin "33" (pinName "RBO") (partNum 1) (symPinNum 33) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "34" (pinName "RB1") (partNum 1) (symPinNum 34) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "35" (pinName "RB2") (partNum 1) (symPinNum 35) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "36" (pinName "RB3") (partNum 1) (symPinNum 36) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "37" (pinName "RB4") (partNum 1) (symPinNum 37) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "38" (pinName "RB5") (partNum 1) (symPinNum 38) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "39" (pinName "RB6/ICSPCLK") (partNum 1) (symPinNum 39) (gateEq 0) (pinEq 0) (pinType Input))
		(compPin "40" (pinName "RB7ICSPDAT") (partNum 1) (symPinNum 40) (gateEq 0) (pinEq 0) (pinType Input))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "PIC16F1789-I_P"))
		(attachedPattern (patternNum 1) (patternName "PIC16F1789-I_P")
			(numPads 40)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
				(padNum 4) (compPinRef "4")
				(padNum 5) (compPinRef "5")
				(padNum 6) (compPinRef "6")
				(padNum 7) (compPinRef "7")
				(padNum 8) (compPinRef "8")
				(padNum 9) (compPinRef "9")
				(padNum 10) (compPinRef "10")
				(padNum 11) (compPinRef "11")
				(padNum 12) (compPinRef "12")
				(padNum 13) (compPinRef "13")
				(padNum 14) (compPinRef "14")
				(padNum 15) (compPinRef "15")
				(padNum 16) (compPinRef "16")
				(padNum 17) (compPinRef "17")
				(padNum 18) (compPinRef "18")
				(padNum 19) (compPinRef "19")
				(padNum 20) (compPinRef "20")
				(padNum 21) (compPinRef "21")
				(padNum 22) (compPinRef "22")
				(padNum 23) (compPinRef "23")
				(padNum 24) (compPinRef "24")
				(padNum 25) (compPinRef "25")
				(padNum 26) (compPinRef "26")
				(padNum 27) (compPinRef "27")
				(padNum 28) (compPinRef "28")
				(padNum 29) (compPinRef "29")
				(padNum 30) (compPinRef "30")
				(padNum 31) (compPinRef "31")
				(padNum 32) (compPinRef "32")
				(padNum 33) (compPinRef "33")
				(padNum 34) (compPinRef "34")
				(padNum 35) (compPinRef "35")
				(padNum 36) (compPinRef "36")
				(padNum 37) (compPinRef "37")
				(padNum 38) (compPinRef "38")
				(padNum 39) (compPinRef "39")
				(padNum 40) (compPinRef "40")
			)
		)
		(attr "Manufacturer_Name" "Microchip")
		(attr "Manufacturer_Part_Number" "PIC16F1789-I/P")
		(attr "Mouser Part Number" "579-PIC16F1789-I/P")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Microchip-Technology-Atmel/PIC16F1789-I-P?qs=7DhvGWG6CtcNtC1kjOxGJQ%3D%3D")
		(attr "Arrow Part Number" "PIC16F1789-I/P")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/pic16f1789-ip/microchip-technology?region=nac")
		(attr "Description" "PIC16F1789-I/P, 8 bit PIC Microcontroller 32MHz 16384 words Flash, 2048 B RAM, USB I2C LIN 40-Pin PDIP")
		(attr "<Hyperlink>" "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA25/1726709.pdf")
	)

)
