//
//  ToolBox.swift
//  FawGenModelAPI
//
//  Created by Erick Olibo on 04/08/2019.
//  Copyright © 2019 DEFKUT Creations OU. All rights reserved.
//

import UIKit


class ToolBox {
    
    public var requestedQuality: QualityOptions = (nil, nil)
    
    // MARK: - Properties
    private let device = UIDevice.current
    private weak var model: FawGenModel!
    private weak var grams: Grams!
    private weak var kNN: KNearestNeighbors!
    
    private(set) var statements: Set<String>
    private(set) var nameToVector: [String : Vector]
    private(set) var synonymsCorpus: Set<String>
    private(set) var synonymsWordsRank: [String : [String]]
    private(set) var combinedVocabulary: Set<String>
    
    private let simpleAssistModel: SimpleAssistModel
    
    init(_ model: FawGenModel, grams: Grams, kNN: KNearestNeighbors) {
        
        statements = model.statements
        nameToVector = model.nameToVector
        synonymsCorpus = model.synonymsCorpus
        synonymsWordsRank = model.synonymsWordsRank
        combinedVocabulary = model.combinedVocabulary
        simpleAssistModel = SimpleAssistModel(model, kNN: kNN)
        
    }
    
}
