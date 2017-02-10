import UIKit

class ColorSwitchViewController: UIViewController {

    @IBOutlet weak var connectionsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func redTapped() {
        self.change(color: .red)
    }

    @IBAction func yellowTapped() {
        self.change(color: .yellow)
    }

    func change(color : UIColor) {
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = color
        }
    }
    
}
