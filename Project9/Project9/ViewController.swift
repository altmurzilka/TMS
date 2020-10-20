//
//  ViewController.swift
//  Project9
//
//  Created by Алтын on 10/20/20.
//

import UIKit

class ViewController: UIViewController {
    
    var text : String?
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myLabel.text = text ?? "No data"
    }
    
    @IBAction func Button1(_ sender: UIButton) {
        
        let student = Student(name: "Petya", age: 22, group: "080605")
        UserDefaults.standard.set(encodable: student, forKey: "student")
        
        //        let image = UIImage(named: "kot")!
        //        let name = self.saveImage(image: image)
        //        UserDefaults.standard.set(name, forKey: "name")
        //        let string = "sdfsfdsjhfsjgfdjsgfsdjf"
        //        UserDefaults.standard.set(string, forKey: "key")
    }
    
    @IBAction func Button2(_ sender: UIButton) {
        
        if let student = UserDefaults.standard.value(Student.self, forKey: "student") {
            self.myLabel.text = student.name
        }
        
        //        if let name = UserDefaults.standard.object(forKey: "name") as? String,
        //           let image = self.loadSave(fileName: name){
        //            self.imageView.image = image
        //        }
        //        if let string = UserDefaults.standard.object(forKey: "key") as? String {
        //            self.myLabel.text = string
        //        }
    }
    
    
    
    
    
    
    
    func saveImage(image: UIImage) -> String? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        
        let fileName = UUID().uuidString
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return nil}
        
        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
            
        }
        
        do {
            try data.write(to: fileURL)
            return fileName
        } catch let error {
            print("error saving file with error", error)
            return nil
        }
        
    }
    
    
    
    func loadSave(fileName:String) -> UIImage? {
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
            
        }
        return nil
    }
    
}


extension UserDefaults {
    
    func set<T: Encodable>(encodable: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key)
        }
    }
    
    func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data,
           let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }
}
