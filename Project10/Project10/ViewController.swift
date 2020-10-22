//
//  ViewController.swift
//  Project10
//
//  Created by Алтын on 10/22/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    
    var myImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        image1.isUserInteractionEnabled = true
        image1.addGestureRecognizer(tapGestureRecognizer1)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        image2.isUserInteractionEnabled = true
        image2.addGestureRecognizer(tapGestureRecognizer2)
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        image3.isUserInteractionEnabled = true
        image3.addGestureRecognizer(tapGestureRecognizer3)
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let customView = CustomView.instanceFromNib()
        let offset: CGFloat = 100
        customView.frame = CGRect(x: self.view.frame.size.width/2 - offset, y: self.view.frame.size.height/2 - offset, width: 200, height: 200)
        customView.label.text = "OLOLO"
        customView.button.setTitle("OK", for: .normal)
        self.view.addSubview(customView)
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        performImagePicker()
    }
    
    private func performImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = .overFullScreen
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
}


extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var  chosenImage = UIImage()
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            chosenImage = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            chosenImage = image
        }
        
        switch myImage {
        case image1:
            self.image1.image = chosenImage

        case image2:
            self.image2.image = chosenImage

        case image3:
            self.image3.image = chosenImage
        default:
            print("lol")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
