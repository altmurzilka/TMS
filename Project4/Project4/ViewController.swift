import UIKit

class ViewController: UIViewController {
    
    let myView = UIView()
    
    // контроллер загружен в память
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        myView.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        myView.backgroundColor = .green
        self.view.addSubview(myView)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        self.myView.frame.origin.x -= 100
        self.myView.frame.size.width += 100
    }
    @IBAction func buttonPresses2(_ sender: UIButton) {
        self.myView.layer.cornerRadius = self.myView.frame.size.width / 2
    }
    //    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        // all view have their places
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        // scree is ready to appear
//        // setup outlets and UI
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        // user sees the screen
//        // set animation etc
//    }

}

