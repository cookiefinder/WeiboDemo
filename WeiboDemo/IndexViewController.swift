import UIKit
//R.Swift
class IndexViewController: UIViewController {

    let titleView = TitleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.translatesAutoresizingMaskIntoConstraints = false;
        titleView.setTriangleImage(image: R.image.triangleArrowD())
        titleView.setVC(vc: self)
        self.navigationItem.titleView = titleView
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if !Api.hasLogin {
                Api().authorize()
            }
        }
    }
    
    @IBAction func handleClickAvatarImage(_ sender: Any) {
        showPopover(vc: UIViewController(), anchor: navigationItem.leftBarButtonItem ?? UIBarButtonItem())
    }
    
    func showPopover(vc: UIViewController, anchor: Any) {
        vc.view.backgroundColor = UIColor.orange
        vc.preferredContentSize = CGSize(width: 200, height: 100)
        vc.modalPresentationStyle = .popover
        // popVC.isModalInPresentation = true
        if let anchor = anchor as? UIView {
            vc.popoverPresentationController?.sourceView = anchor
        } else if let anchor = anchor as? UIBarButtonItem {
            vc.popoverPresentationController?.barButtonItem = anchor
        }
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.permittedArrowDirections = .any
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension IndexViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
    
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        titleView.setTriangleImage(image: UIImage(named: "triangle-arrow-u"))
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        titleView.setTriangleImage(image: UIImage(named: "triangle-arrow-d"))
    }
}
