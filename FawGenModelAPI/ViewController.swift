//
//  ViewController.swift
//  FawGenModelAPI
//
//  Created by Erick Olibo on 04/08/2019.
//  Copyright © 2019 DEFKUT Creations OU. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var randomizeBtn: UIButton!
    @IBOutlet weak var listOfWordsLbl: UILabel!
    
    // Actions
    @IBAction func tappedRandomized(_ sender: UIButton) {
        let start = Date()
        getAllTypesOfRandomWords()
        print("ViewController ==> [tappedRandomize] - \(start.toNowProcessDuration)")
    }
    

    
    // MARK: - Properties
    var difference = CGFloat()
    var start = Date()
    var persistent: Persistent!
    
    var launchView: StartingEngine!
    var launchBackground = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        printDeviceInfo()
        setpUpBackground()
        randomizeBtn.setTitle("Randomize", for: .normal)
        loadModelToMemory()
        
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
        listOfWordsLbl.text = titlesList
        print("\(titlesList)\n")
    }
    
    
}

// MARK: - Extension for animations Setup and running
extension ViewController {
    
    private func loadModelToMemory() {
        start = Date()
        setupLaunchView()
        animateAppear()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            let model = FawGenModel()
            model.delegate = self
            model.initialize()
            
            DispatchQueue.main.async { [weak self] in
                let grams = Grams(model)
                let kNN = KNearestNeighbors(model)
                let toolBox = ToolBox(model, grams: grams, kNN: kNN)
                self?.persistent = Persistent(model, kNN, toolBox, grams)
                
                print("from Queue to model: \(self!.start.toNowProcessDuration)")
                self?.animateDissapear()
            }
        }
    }
    
    
    private func setpUpBackground() {
        launchBackground = UIView(frame: self.view.bounds)
        launchBackground.backgroundColor = .white
        launchBackground.center = self.view.center
        self.view.addSubview(launchBackground)
    }
    
    private func setupLaunchView() {
        let launchFrame = CGRect(x: 0, y: 0, width: 200, height: 300)
        launchView = StartingEngine(frame: launchFrame)
        
        // Set the view offSet
        let launchViewCenterX = self.view.center.x
        let launchViewCenterY = self.view.bounds.height + (launchFrame.height / 2) + 10
        let launchViewCenter = CGPoint(x: launchViewCenterX, y: launchViewCenterY)
        launchView.center = launchViewCenter
        self.view.addSubview(launchView)
    }
    
    private func animateAppear() {
        difference = self.view.center.y - launchView.center.y
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.launchView.startAnimating()
            self.launchView.transform = CGAffineTransform(translationX: 0, y: self.difference)
        }) { (_) in
            
        }
        
    }
    
    private func animateDissapear() {
        launchView.stopAnimating()
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: .curveEaseIn, animations: {
            self.launchView.transform = CGAffineTransform(translationX: 0, y: -self.difference)
            self.launchBackground.alpha = 0
        }) { (_) in
            self.launchView.stopAnimating()
            self.launchBackground.removeFromSuperview()
            self.launchView.removeFromSuperview()
        }
    }
    
    
}




extension ViewController: FawGenModelDelegate {
    func FawGenModelLoadingCompletion(at percent: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.launchView.progressBar.setProgressWithAnimationTo(percent)
        }
        //print("[FawGenModelLoadingCompletion] at \(percent)%")
    }
    
    
}
