//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 08.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var answers: [Answer]!
    
    @IBOutlet var youAreLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let (animalCharacter, animalDescription) = youAreAnimal()
        
        youAreLabel.text = "Вы - \(animalCharacter)"
        descriptionLabel.text = animalDescription
    }
}

extension ResultsViewController {
    
    private func youAreAnimal() -> (Character, String) {
        var animalTypeCount = [AnimalType: Int]()
        
        answers.forEach {
            animalTypeCount[$0.type, default: 0] += 1
        }
        
        let sortedAnswers = animalTypeCount.sorted {
            $0.1 > $1.1
        }
        
        return (
            sortedAnswers.first!.key.rawValue,
            sortedAnswers.first!.key.definition
        )
    }
}
