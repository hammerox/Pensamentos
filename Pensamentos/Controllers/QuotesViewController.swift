//
//  ViewController.swift
//  Pensamentos
//
//  Created by Usuário Convidado on 14/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var quoteText: UILabel!
    
    private let quoteManager = QuotesManager.shared
    private let config = Configuration.shared
    private let tintColor = UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
    private let darkBackgroundColor = UIColor(red: 96.0/255.0, green: 125/255.0, blue: 139/255.0, alpha: 1.0)
    
    private var timer: Timer?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        formatView()
        prepareQuote()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func formatView() {
        view.backgroundColor = config.colorScheme == 0 ? .white : darkBackgroundColor
        quoteText.textColor = config.colorScheme == 0 ? .black : .white
        nameText.textColor = config.colorScheme == 0 ? tintColor : .yellow
    }
    
    
    func prepareQuote() {
        timer?.invalidate()
        if config.autorefresh {
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
                self.showRandomQuote()
            }
        }
        showRandomQuote()
    }
    
    
    func showRandomQuote() {
        let quote = quoteManager.getRandomQuote()
        nameText.text = quote.author
        quoteText.text = quote.quote
        pictureImage.image = UIImage(named: quote.image)
        animateViews()
    }
    
    
    func animateViews() {
        pictureImage.alpha = 0
        nameText.alpha = 0
        quoteText.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.pictureImage.alpha = 1
            self.nameText.alpha = 1
            self.quoteText.alpha = 1
        }
    }

}

