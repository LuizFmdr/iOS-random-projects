//
//  ViewController.swift
//  CardWorkout
//
//  Created by Luiz Filipe Medeira on 26/11/23.
//

import UIKit

class CardSelectionViewController: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    var timer: Timer!
    var cards: [UIImage] = Card.generateCardaList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        buttons.forEach {
            $0.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRanomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRanomImage() {
        cardImageView.image = cards.randomElement()
    }

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restardButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}

