//
//  ConfigViewController.swift
//  Pensamentos
//
//  Created by Usuário Convidado on 14/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    
    private let config = Configuration.shared
    @IBOutlet weak var autorefreshSwitch: UISwitch!
    @IBOutlet weak var timeIntervalSlider: UISlider!
    @IBOutlet weak var colorSchemeSegmented: UISegmentedControl!
    @IBOutlet weak var timeIntervalText: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setViews() {
        autorefreshSwitch.isOn = config.autorefresh
        timeIntervalSlider.value = Float(config.timeInterval)
        timeIntervalText.text = String(format:"%.1f", config.timeInterval)
        colorSchemeSegmented.selectedSegmentIndex = config.colorScheme
    }
    

    @IBAction func onAutorefreshChange(_ sender: UISwitch) {
        config.autorefresh = sender.isOn
    }
    
    @IBAction func onTimeIntervalChange(_ sender: UISlider) {
        config.timeInterval = Double(sender.value)
        timeIntervalText.text = String(format:"%.1f", sender.value)
    }
    
    @IBAction func onColorSchemeChange(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    
}
