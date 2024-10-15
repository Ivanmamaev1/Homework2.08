//
//  ResultViewController.swift
//  Homework2.08
//
//  Created by Ivan on 12.10.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var results: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        showAnimal()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    func showResult(of animal: Animal) {
        resultLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = animal.definition
    }
    
    func showAnimal() {
        var typeOfAnimal: [Animal: Int] = [:]
        var animals: [Animal] = []
        
        for result in results {
            animals.append(result.animal)
        }
        
        for animal in animals {
            typeOfAnimal[animal, default: 0] += 1
        }
        
        guard let sortedTypeOfAnimal = typeOfAnimal.max(
            by: { $0.value < $1.value
            })?.key else { return }
        
        showResult(of: sortedTypeOfAnimal)
    }
}
