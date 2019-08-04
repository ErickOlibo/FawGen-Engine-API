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
        persistent = Persistent(model, kNN, toolBox)
    
        printDeviceInfo()
        getAllTypesOfRandomWords()
        
    }


}


extension ViewController {
    
    private func printDeviceInfo() {
        let device = UIDevice.current
        print("ModelName: \(device.modelName)")
        print("Processing Power: \(device.processingPower.rawValue)")
    }
    
    // UNIQUE Methods that returns all type of MadeUpWords for Keywords or None (Assist & Simple)
    private func getAllTypesOfRandomWords() {

        persistent.toolBox.requestedQuality = (nil, nil)
        let empty = String()
        guard let allWords = persistent.toolBox.generateMadeUpWords(from: empty) else { return }

        var collection = [MadeUpAlgo : Set<MadeUpWord>]()
        for type in MadeUpAlgo.allCases {
            let group = allWords.filter { $0.madeUpAlgo == type }
            guard group.count != 0 else { continue }
            collection[type] = group
        }

        for (type, list) in collection {
            print("type: \(type.rawValue) ==> ListCount: \(list.count)")
        }
        printResult(list: Array(allWords))

    }
    
    private func printResult(list: [MadeUpWord]) {
        print("PRINTSIZE OF LIST: \(list.count)")
        let titlesList = list.map{ $0.title }.joined(separator: " - ")
        //listOfWordsLabel.text = titlesList
        print("\(titlesList)\n")
    }
    
    
}






extension ViewController: FawGenModelDelegate {
    func FawGenModelLoadingCompletion(at percent: Int) {
        //print("[FawGenModelLoadingCompletion] at \(percent)%")
    }
    
    
}
