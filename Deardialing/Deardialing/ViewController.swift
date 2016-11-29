//
//  ViewController.swift
//  Deardialing
//
//  Created by KingCQ on 2016/11/28.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit
import ContactsUI
import Dialkit

class ViewController: UIViewController, CNContactPickerDelegate {
    var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField = UITextField(frame: CGRect(x: 20, y: 100, width: 200, height: 44))
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .done, target: self, action: #selector(save))
    }
    
    func save() {
        let contacts = NSKeyedUnarchiver.unarchiveObject(withFile: groupFilePath) as? [Contact]
        contacts?.forEach { contact in
            print(contact.familyName, contact.givenName, contact.imageData, contact.phoneNumber)
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let contact = CNContactPickerViewController()
        contact.delegate = self
        present(contact, animated: true, completion: nil)
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("cancel")
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        NSKeyedArchiver.archiveRootObject(contacts.map({Contact(familyName: $0.familyName, givenName: $0.givenName, phoneNumber: $0.phoneNumbers.first?.value.stringValue, imageData: $0.imageData)}), toFile: groupFilePath)
        print(groupFilePath, "🐱", FileManager.default.isReadableFile(atPath: groupFilePath))

    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
//        print(contactProperty.key, contactProperty.value)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

