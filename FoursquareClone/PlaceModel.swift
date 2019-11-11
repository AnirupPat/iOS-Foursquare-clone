//
//  PlaceModel.swift
//  FoursquareClone
//
//  Created by Anirup Patnaik on 06/11/19.
//  Copyright © 2019 Virtuelabs. All rights reserved.
//

import Foundation
import UIKit

class PlaceModel {
    static let sharedInstance = PlaceModel()
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    private init() {
        
    }
}
