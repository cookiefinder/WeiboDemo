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
        checkAccessTokenIsInvalid()
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
    
    func checkAccessTokenIsInvalid() {
        let nowDate: Date = DateFormatter().date(from: Date().description(with: Locale.current)) ?? Date()
        
        // TODO compare expire date and locale date
        let isExpire = LoginManager.expirationDate?.compare(nowDate) == .orderedAscending
        if isExpire {
            LoginManager.refreshToken { (result) in
                switch result {
                case .success(let data):
                    if data.expiresIn ?? 0 > 0 {
                        // TODO new expire date = now date add 1 day or 30 days
                        let newExpirationDate = nowDate.addingTimeInterval(1 * 24 * 60 * 60)
                        LoginManager.saveToDisk(param: [
                            "accessToken": data.accessToken ?? "",
                            "userID": data.userId ?? "",
                            "refreshToken": data.refreshToken ?? "",
                            "expirationDate": newExpirationDate
                        ])
                    } else {
                        LoginManager.authorize()
                    }
                case .failure(let apiError):
                    print(apiError)
                    LoginManager.authorize()
                }
                
            }
        } else if !LoginManager.hasLogin {
            LoginManager.authorize()
        }
        
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
