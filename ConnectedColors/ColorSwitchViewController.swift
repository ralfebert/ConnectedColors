import UIKit

class ColorSwitchViewController: UIViewController {

    @IBOutlet weak var connectionsLabel: UILabel!

    let colorService = ColorService()

    override func viewDidLoad() {
        super.viewDidLoad()
        colorService.delegate = self
    }

    @IBAction func redTapped() {
        self.change(color: .red)
        colorService.send(colorName: "red")
    }

    @IBAction func yellowTapped() {
        self.change(color: .yellow)
        colorService.send(colorName: "yellow")
    }

    func change(color : UIColor) {
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = color
        }
    }
    
}

extension ColorSwitchViewController : ColorServiceDelegate {

    func connectedDevicesChanged(manager: ColorService, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectionsLabel.text = "Connections: \(connectedDevices)"
        }
    }

    func colorChanged(manager: ColorService, colorString: String) {
        OperationQueue.main.addOperation {
            switch colorString {
            case "red":
                self.change(color: .red)
            case "yellow":
                self.change(color: .yellow)
            default:
                NSLog("%@", "Unknown color value received: \(colorString)")
            }
        }
    }

}
