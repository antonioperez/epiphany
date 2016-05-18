//
//  Constants.swift
//  epiphany
//
//  Created by Antonio Perez on 4/12/16.
//  Copyright © 2016 Antonio Perez. All rights reserved.
//

import Foundation
import UIKit


//var greenHex = "508104"  1
//var brownHex = "9E8E01"   2
//var yellowHex = "F3B800"   3
//var orangeHex = "DB8200"   4
//var redHex = "B64201"  5


var GREEN_COLOR = UIColor(red: 0.314, green: 0.506, blue: 0.016, alpha: 1.00)
var BROWN_COLOR = UIColor(red: 0.620, green: 0.557, blue: 0.004, alpha: 1.00)
var YELLOW_COLOR = UIColor(red: 0.953, green: 0.722, blue: 0.00, alpha: 1.00)
var ORANGE_COLOR = UIColor(red: 0.859, green: 0.510, blue: 0.00, alpha: 1.00)
var RED_COLOR = UIColor(red: 0.714, green: 0.259, blue: 0.004, alpha: 1.00)
var WHITE_COLOR = UIColor(red:0.980, green:0.980, blue:0.980, alpha:1.00)

//Global Function that will allow us to have callbacks in a custom function
// ex) callBack after JSON call is done downloading
public typealias DownloadComplete = () -> ()