import UIKit
import GroupActivities
import CoreTransferable

class ViewController: UIViewController {
    let button: UIButton = UIButton(configuration: .filled())
    let toggle: UISwitch = UISwitch(frame: .null)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        button.configuration?.title = "Present"
        
        let stackView = UIStackView(
            arrangedSubviews: [
                toggle,
                button
            ]
        )
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            stackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            view.trailingAnchor.constraint(
                equalTo: stackView.safeAreaLayoutGuide.trailingAnchor,
                constant: 20
            ),
        ])
        
        button.addAction(UIAction { [unowned self] _ in
            let vc = ModalViewController()
            vc.modalPresentationStyle = toggle.isOn ? .fullScreen : .automatic
            present(vc, animated: true)
        }, for: .primaryActionTriggered)
    }
}

