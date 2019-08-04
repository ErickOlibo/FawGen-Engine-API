//
//  Persistent.swift
//  FawGenModelAPI
//
//  Created by Erick Olibo on 04/08/2019.
//  Copyright © 2019 DEFKUT Creations OU. All rights reserved.
//

import Foundation

class Persistent {
    
    private(set) weak var model: FawGenModel!
    private(set) weak var kNN: KNearestNeighbors!
    
    private(set) weak var toolBox: ToolBox!
    
    init(_ model: FawGenModel, _ kNN: KNearestNeighbors, _ toolBox: ToolBox) {
        self.model = model
        self.kNN = kNN
        self.toolBox = toolBox
    }
    
    
}
