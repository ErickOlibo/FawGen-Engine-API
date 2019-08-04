//
//  ViewController.swift
//  FawGenModelAPI
//
//  Created by Erick Olibo on 04/08/2019.
//  Copyright © 2019 DEFKUT Creations OU. All rights reserved.
//

import UIKit

// private typeAlias
private typealias Chains = [String : [String]]

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let model = FawGenModel()
        model.delegate = self
        
        model.initialize()
        printModelCounts(model)
        
        let grams = Grams(model)
        print("GRAMS ==> biGramsChains count: \(grams.biGramChains.count)")
        
        print("RandomBiGramstart: \(grams.randomBiGramStart)")
        print("Has Passed Grams checker for Defkut: \(grams.hasPassedGramsChecker("Defkut"))")
//        let fawgenConstants = FawGenConstants.shared
//        fawgenConstants.initialize(model)
//        print("Shared 1 - FinalCorpus: \(fawgenConstants.finalCorpus.count)")
//        let fgConstants = FawGenConstants.shared
//        print("Shared 2 - FinalCorpus: \(fgConstants.finalCorpus.count)")
        
        
    }


}


extension ViewController {
    
    private func printModelCounts(_ model: FawGenModel) {
        print("[statements] Size: \(model.statements.count)")
        print("[biGramsStart] Size: \(model.biGramsStart.count)")
        print("[triGramsStart] Size: \(model.triGramsStart.count)")
        print("[wantedLeftBiGramsSet] Size: \(model.wantedLeftBiGramsSet.count)")
        print("[wantedLeftTriGramsSet] Size: \(model.wantedLeftTriGramsSet.count)")
        print("[wantedLeftFourGramsSet] Size: \(model.wantedLeftFourGramsSet.count)")
        print("[wantedRightFourGramsSet] Size: \(model.wantedRightFourGramsSet.count)")
        print("[finalCorpus] Size: \(model.finalCorpus.count)")
        print("[synonymsCorpus] Size: \(model.synonymsCorpus.count)")
        print("[synonymsWordsRank] Size: \(model.synonymsWordsRank.count)")
        print("[biGramFrequencies] Size: \(model.biGramFrequencies.count)")
        print("[combinedVocabulary] Size: \(model.combinedVocabulary.count)")
        print("[vectorsNameByLength] Size: \(model.vectorsNameByLength.count)")
        print("[combinedNameByLength] Size: \(model.combinedNameByLength.count)")
        print("[biGramChains] Size: \(model.biGramChains.count)")
        print("[triGramChains] Size: \(model.triGramChains.count)")
        print("[nameToVector] Size: \(model.nameToVector.count)")
        print("[collectionOfVectors] Size: \(model.collectionOfVectors.count)")
        print("[centroids] Size: \(model.centroids.count)")
        print("[classificationByCentroids] Size: \(model.classificationByCentroids.count)")
        
        
    }
    
}

extension ViewController: FawGenModelDelegate {
    func FawGenModelLoadingCompletion(at percent: Int) {
        print("[FawGenModelLoadingCompletion] at \(percent)%")
    }
    
    
}
