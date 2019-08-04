//
//  FawGenConstants.swift
//  FawGenModelAPI
//
//  Created by Erick Olibo on 04/08/2019.
//  Copyright © 2019 DEFKUT Creations OU. All rights reserved.
//

import Foundation

class FawGenConstants {
    
    static let shared = FawGenConstants()
    
    // MARK: - Properties
    private(set) var statements = Set<String>()
    private(set) var biGramsStart = Set<String>()
    private(set) var triGramsStart = Set<String>()
    private(set) var wantedLeftBiGramsSet = Set<String>()
    private(set) var wantedLeftTriGramsSet = Set<String>()
    private(set) var wantedLeftFourGramsSet = Set<String>()
    private(set) var wantedRightFourGramsSet = Set<String>()
    private(set) var finalCorpus = Set<String>()
    private(set) var synonymsCorpus = Set<String>()
    private(set) var synonymsWordsRank = [String : [String]]()
    private(set) var biGramFrequencies = [String : Int]()
    
    private(set) var combinedVocabulary = Set<String>()
    private(set) var vectorsNameByLength = [Set<String>]()
    private(set) var combinedNameByLength = [Set<String>]()
    
    private(set) var biGramChains = [String : [String]]()
    private(set) var triGramChains = [String : [String]]()
    
    private(set) var nameToVector = [String : Vector]()
    private(set) var collectionOfVectors = [Vector]()
    private(set) var centroids = [Vector]()
    private(set) var classificationByCentroids = [[Vector]]()
    
    
    
    public func initialize(_ model: FawGenModel) {
        print("Trying to Initialize Shared model in FawGenConstants")
        
    }
}
