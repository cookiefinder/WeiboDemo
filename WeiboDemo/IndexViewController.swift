import UIKit

class IndexViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    var titleView = TitleView()
    var titleViewIsPop = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView.translatesAutoresizingMaskIntoConstraints = false;
        titleView.setTriangleImage(image: UIImage(named: "triangle-arrow-d") ?? UIImage())
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        titleView.addGestureRecognizer(gesture)
        self.navigationItem.titleView = titleView
        
        
    }
    @IBAction func handleClickAvatarImage(_ sender: Any) {
        showPopover(vc: UIViewController(), anchor: navigationItem.leftBarButtonItem ?? UIBarButtonItem())
    }
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        if !titleViewIsPop {
            titleView.setTriangleImage(image: UIImage(named: "triangle-arrow-u") ?? UIImage())
        } else {
            titleView.setTriangleImage(image: UIImage(named: "triangle-arrow-d") ?? UIImage())
        }
        titleViewIsPop = !titleViewIsPop
        showPopover(vc: UIViewController(), anchor: navigationItem.titleView ?? UIView())
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
    
    func showPopover(vc: UIViewController, anchor: Any) {
        vc.view.backgroundColor = UIColor.orange
        vc.preferredContentSize = CGSize(width: 200, height: 100)
        vc.modalPresentationStyle = .popover
        // popVC.isModalInPresentation = true
        if let anchor:UIView = anchor as? UIView {
            vc.popoverPresentationController?.sourceView = anchor
        } else {
            vc.popoverPresentationController?.barButtonItem = anchor as? UIBarButtonItem
        }
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.permittedArrowDirections = .any
        self.present(vc, animated: true, completion: nil)
    }
}
