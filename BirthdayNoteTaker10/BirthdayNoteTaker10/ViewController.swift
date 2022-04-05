//
//  ViewController.swift
//  BirthdayNoteTaker10
//
//  Created by Yavuz Güner on 17.02.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayTextBox: UITextField!
    @IBOutlet weak var nameTextBox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Açıldığı zaman eskiden girilen verileri çekmemiz lazım
        
        let storedName =  UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting işlemi gerçekleştireceğiz.
        // as? veya as! gibi
        
        if let newName = storedName as? String{
            nameLabel.text = "Name: \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
    }
    @IBAction func saveClicked(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextBox.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextBox.text!, forKey: "birthday")
        
        
        nameLabel.text = "Name: \(nameTextBox.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextBox.text!)"
        
    }

    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //!= nil (Eğer boş değilse anlamına gelir)
        if (storedName as?  String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text="Name: "
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text="Birthday: "
        }
        
        
        UserDefaults.standard.removeObject(forKey: "name")
        
        
    }
}

