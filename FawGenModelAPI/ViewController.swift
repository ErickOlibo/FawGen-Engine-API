//
//  ViewController.swift
//  FawGenModelAPI
//
//  Created by Erick Olibo on 04/08/2019.
//  Copyright © 2019 DEFKUT Creations OU. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: - Properties
    var start = Date()
    var persistent: Persistent!

    override func viewDidLoad() {
        super.viewDidLoad()

        let model = FawGenModel()
        model.delegate = self
        model.initialize()
        
        let grams = Grams(model)
        let kNN = KNearestNeighbors(model)
        let toolBox = ToolBox(model, grams: grams, kNN: kNN)
        print("GRAMS ==> biGramsChains count: \(grams.biGramChains.count)")
        print("RandomBiGramstart: \(grams.randomBiGramStart)")
        print("Has Passed Grams checker for Defkut: \(grams.hasPassedGramsChecker("Defkut"))")
        print("KNN ==> Centroids Count: \(kNN.centroids.count)")
        print("[END ViewController] ToolBox ==> Statements: \(toolBox.statements.count)")
        
        persistent = Persistent(model, kNN, toolBox)
    
        printDeviceInfo()
  
        
        
    }


}


extension ViewController {
    
    private func printDeviceInfo() {
        
        let device = UIDevice.current
        print("ModelName: \(device.modelName)")
        print("Processing Power: \(device.processingPower.rawValue)")
        
    }
    
    
}

extension ViewController: FawGenModelDelegate {
    func FawGenModelLoadingCompletion(at percent: Int) {
        //print("[FawGenModelLoadingCompletion] at \(percent)%")
    }
    
    
}
