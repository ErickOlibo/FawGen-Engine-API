//
//  Flavorizer.swift
//  FawGenModelAPI
//
//  Created by Erick Olibo on 04/08/2019.
//  Copyright © 2019 DEFKUT Creations OU. All rights reserved.
//

import Foundation

class Flavorizer {
    
    // MARK: - Properties
    private enum form: String {
        case vcv = "VCV"
        case cv = "CV"
        case vc = "VC"
    }
    
    private let vows = ModelConstants.vows
    private let cons = ModelConstants.cons
    private let vowels = ModelConstants.vowels
    private let consonants = ModelConstants.consonants
    
    private var quality: QualityOptions = (nil, nil)
    private var list = Set<String>()
    private var uniqueMadeUpWords = Set<String>()
    private let maxResultsPerType = ModelConstants.maxResultsPerTypeOfAlgorithm * 2
    private let maxIterations = ModelConstants.maxIterations
    private let listMinCount = 20
    private let space = " "
    
    private var allWordBreaks = [WordBreak]()
    private var left = Set<WordBreak>()
    private var center = Set<WordBreak>()
    private var right = Set<WordBreak>()
    
    private var combinedVocabulary: Set<String>
    private weak var model: FawGenModel!
    private weak var grams: Grams!
    
    init(_ model: FawGenModel, grams: Grams) {
        combinedVocabulary = model.combinedVocabulary
        self.grams = grams
        print("[Flavorizer] Combined Vocab size: \(combinedVocabulary.count)")
    }
    
    
    
}

// MARK: - Public methods
extension Flavorizer {
    
}



// MARK: - Private methods
extension Flavorizer {
    
}
