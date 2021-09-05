//
//  ViewController.swift
//  TrafficSegues
//
//  Created by Евгений Мелешков on 26.08.2021.
//
//
import UIKit

class ViewController: UIViewController {

 
    @IBOutlet var segueSwitch: UISwitch!
    @IBOutlet var switchStatusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switching()
        // Do any additional setup after loading the view.
    }

    func switching() {
        if segueSwitch.isOn {
            switchStatusLabel.text = "ON"
        } else if !segueSwitch.isOn {
            switchStatusLabel.text = "OFF"
        }
    }
    
    
    @IBAction func switchingButton(_ sender: Any) {
        switching()
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            let yellowVc = storyboard?.instantiateViewController(identifier: "YellowViewController")
            let greenVc = storyboard?.instantiateViewController(identifier: "GreenViewController")
        
        
       guard !segueSwitch.isOn else {
           if identifier == "Yellow" {
               show(yellowVc!, sender: nil)
           }
           if identifier == "Green" {
               show(greenVc!, sender: nil)
           }
           return false
       }
       return true
    }
    
    @IBAction func yellowButtonTapped(_ sender: Any) {
        shouldPerformSegue(withIdentifier: "Yellow", sender: nil)
    }
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        shouldPerformSegue(withIdentifier: "Green", sender: nil)
    }
    
}

