import UIKit

class IndexViewController: UIViewController {

    let titleView = TitleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.translatesAutoresizingMaskIntoConstraints = false;
        titleView.setTriangleImage(image: R.image.triangleArrowD())
        titleView.setVC(vc: self)
        self.navigationItem.titleView = titleView
        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            Api().authorize()
//        }
    }
    
    @IBAction func handleClickAvatarImage(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = sb.instantiateViewController(withIdentifier: "AvatarViewController") as! AvatarViewController
        showPopover(vc: vc, anchor: navigationItem.leftBarButtonItem ?? UIBarButtonItem())
    }
    
    func showPopover(vc: UIViewController, anchor: Any) {
//        vc.view.backgroundColor = UIColor.orange
        vc.modalPresentationStyle = .popover
        // popVC.isModalInPresentation = true
        if let anchor = anchor as? UIView {
            vc.popoverPresentationController?.sourceView = anchor
            vc.preferredContentSize = CGSize(width: 200, height: 300)
        } else if let anchor = anchor as? UIBarButtonItem {
            vc.popoverPresentationController?.barButtonItem = anchor
            vc.preferredContentSize = CGSize(width: 300, height: 80)
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
        titleView.setTriangleImage(image: R.image.triangleArrowU())
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        titleView.setTriangleImage(image: R.image.triangleArrowD())
    }
}
