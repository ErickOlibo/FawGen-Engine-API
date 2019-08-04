//
//  Grams.swift
//  FawGenModelAPI
//
//  Created by Erick Olibo on 04/08/2019.
//  Copyright © 2019 DEFKUT Creations OU. All rights reserved.
//

import Foundation


class Grams {
    
    
    private weak var model: FawGenModel!
    
    public var biGramChains = [String : [String]]()
    public var triGramChains = [String : [String]]()
    
    public var biGramFrequencies = [String : Int]()
    public var biGramsStart = Set<String>()
    public var triGramsStart = Set<String>()
    
    public var wantedLeftBiGrams = Set<String>()
    public var wantedLeftTriGrams = Set<String>()
    public var wantedLeftFourGrams = Set<String>()
    public var wantedRightFourGrams = Set<String>()
    
    init(_ model: FawGenModel) {
        self.model = model
        biGramChains = model.biGramChains
        triGramChains = model.triGramChains
        
        biGramFrequencies = model.biGramFrequencies
        biGramsStart = model.biGramsStart
        triGramsStart = model.triGramsStart
        
        wantedLeftBiGrams = model.wantedLeftBiGramsSet
        wantedLeftTriGrams = model.wantedLeftTriGramsSet
        wantedLeftFourGrams = model.wantedLeftFourGramsSet
        wantedRightFourGrams = model.wantedRightFourGramsSet
        
    }
    
    
    
}


extension Grams {
    
}
