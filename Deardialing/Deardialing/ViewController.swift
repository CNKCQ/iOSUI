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

class ViewController: UIViewController {
    var tableView: UITableView!
    var datas: [Contact] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .done, target: self, action: #selector(save))
    }
    
    func save() {
        let contacts = NSKeyedUnarchiver.unarchiveObject(withFile: groupFilePath) as? [Contact]
        contacts?.forEach { contact in
            print(contact.familyName, contact.givenName, contact.imageData, contact.phoneNumber)
        }

    }
    
    func add() {
        let contact = CNContactPickerViewController()
        contact.delegate = self
        present(contact, animated: true, completion: nil)
    }
    
}

extension ViewController: CNContactPickerDelegate {
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("cancel")
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        datas = contacts.map({Contact(familyName: $0.familyName, givenName: $0.givenName, phoneNumber: $0.phoneNumbers.first?.value.stringValue, imageData: $0.imageData)})
        NSKeyedArchiver.archiveRootObject(datas, toFile: groupFilePath)
        print(groupFilePath, "🐱", FileManager.default.isReadableFile(atPath: groupFilePath))
        
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
        //        print(contactProperty.key, contactProperty.value)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let contact = datas[indexPath.row]
        cell.imageView?.image = UIImage(data: contact.imageData)
        cell.textLabel?.text = "\(contact.givenName)  \(contact.phoneNumber)"
        return cell
    }
}

