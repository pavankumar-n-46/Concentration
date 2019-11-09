//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Pavan Kumar N on 03/11/19.
//  Copyright © 2019 https://github.com/pavankumar-n-46. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {
    
    let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
        "Animals": "🐶🦆🐹🐸🐘🦍🐓🐩🐦🦋🐙🐏",
        "Faces": "😀😌😎🤓😠😤😭😰😱😳😜😇",
        "Hollowen" : "👻🎃😈🤖🙀👽👾🤡👀🥶👹☠️"
    ]
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController, cvc.theme == nil {
            return true
        } else {
            return false
        }
    }
    
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    @IBAction func chooseTheme(_ sender: Any) {
        
        if let cvc = splitViewDetailConcentrationViewController, let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
            cvc.theme = theme
        } else if let cvc = lastSeguedToConcentrationViewController, let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
            cvc.theme = theme
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "ChooseTheme", sender: sender)
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
            if let cvc = segue.destination as? ConcentrationViewController {
                cvc.theme = theme
                lastSeguedToConcentrationViewController = cvc
            }
        }
    }
}
