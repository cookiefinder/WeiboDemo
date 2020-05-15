import UIKit

class FeedViewController: UIViewController {
    private let titleView = TitleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.translatesAutoresizingMaskIntoConstraints = false;
        titleView.setTriangleImage(image: R.image.triangleArrowD())
        titleView.didTap = { [weak self] in
            guard let self = self else { return }
            let vc = R.storyboard.main.titleViewController()!
            vc.getCurrentTopic = {
                self.titleView.getCurrentTopic()
            }
            vc.updateCurrentTopic = {(topic: String) -> Void in
                self.titleView.updateCurrentTopic(topic: topic)
            }
            self.titleView.setTriangleImage(image: R.image.triangleArrowU())
            self.showPopover(vc: vc, anchor: self.titleView)
        }
        navigationItem.titleView = titleView
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if !LoginManager.hasLogin {
                LoginManager().authorize()
            }
        }
    }
    
    @IBAction func handleClickAvatarImage(_ sender: Any) {
        let vc = R.storyboard.main.avatarViewController()!
        showPopover(vc: vc, anchor: navigationItem.leftBarButtonItem ?? UIBarButtonItem())
    }
    
    func showPopover(vc: UIViewController, anchor: Any) {
        vc.modalPresentationStyle = .popover
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.permittedArrowDirections = .any
        
        if let anchor = anchor as? UIView {
            vc.popoverPresentationController?.sourceView = anchor
        } else if let anchor = anchor as? UIBarButtonItem {
            vc.popoverPresentationController?.barButtonItem = anchor
        }
        present(vc, animated: true, completion: nil)
    }
}

extension FeedViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        titleView.setTriangleImage(image: R.image.triangleArrowD())
    }
}
