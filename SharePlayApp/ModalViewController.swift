import UIKit

class ModalViewController: UIViewController {
    let label: UILabel = UILabel()
    let button: UIButton = UIButton(configuration: .filled())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        button.configuration?.title = "dismiss"
        
        let stackView = UIStackView(
            arrangedSubviews: [
                label,
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
            dismiss(animated: true)
        }, for: .primaryActionTriggered)
        
        // ❗ When present without fullscreen, NameDrop not working.
        let url = URL(string: "https://apple.com")!
        activityItemsConfiguration = UIActivityItemsConfiguration(objects: [url as NSURL])
    }
}
