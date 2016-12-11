//
//  PetStatusViewController.swift
//  SpiritPets
//
//  Created by padrao on 06/12/16.
//  Copyright © 2016 Edvaldo Junior. All rights reserved.
//

import UIKit

class PetStatusViewController: UIViewController {

    
    @IBOutlet weak var mySubView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var atkLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var experenceLabel: UILabel!
    @IBOutlet weak var staminiaLabel: UILabel!
    @IBOutlet weak var sleepLabel: UILabel!
    @IBOutlet weak var feedLabel: UILabel!
    var pet: PetChoosed!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(setupLabels),name: NSNotification.Name(rawValue: "UpdateStatusNotification"), object: nil)
        
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "background")!)
        self.mySubView.backgroundColor = UIColor.init(patternImage: UIImage(named: "roundedRect")!)
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func onGoBackTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupLabels(){
        let battleAtt = pet.battleAtt
        let growthAtt = pet.growthAtt
        
        hpLabel.text = "HP: \(battleAtt.hp!)"
        atkLabel.text = "ATK: \(battleAtt.atk!)"
        defLabel.text = "DEF: \(battleAtt.dfs!)"
        levelLabel.text = "Level: \(battleAtt.lv!)"
        evolutionLabel.text = "Evolution Stage: \(pet.stage)"
        experenceLabel.text = "\(battleAtt.xp!)"
        staminiaLabel.text = "\(growthAtt.stamina!)"
        sleepLabel.text = "\(growthAtt.awake!)"
        feedLabel.text = "\(growthAtt.fed!)"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
