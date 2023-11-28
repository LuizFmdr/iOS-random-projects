import UIKit

class CardSelectionViewController: UIViewController {

    let cardImageVew = UIImageView()
    let stopButton = CWButton(backgroundColor: .systemRed, title: "Stop")
    let resetButton = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    var timer: Timer!
    var cards: [UIImage] = CardListFactory.generateCardaList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    func startTimer() {
       timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRanomImage), userInfo: nil, repeats: true)
    }
        
    @objc func showRanomImage() {
       cardImageVew.image = cards.randomElement()
    }
    
    func configureUI() {
       configureCardImageView()
       configureStopButton()
       configureResetButton()
        configureRulesButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageVew)
        cardImageVew.translatesAutoresizingMaskIntoConstraints = false
        cardImageVew.image = UIImage(imageLiteralResourceName: "2C.png")
        
        NSLayoutConstraint.activate([
            cardImageVew.widthAnchor.constraint(equalToConstant: 250),
            cardImageVew.heightAnchor.constraint(equalToConstant: 350),
            cardImageVew.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageVew.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageVew.bottomAnchor, constant: 30)
        ])
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant:  50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 24)
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant:  50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 24)
        ])
    }
}

