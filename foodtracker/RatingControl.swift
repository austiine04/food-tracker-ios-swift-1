import UIKit

class RatingControl: UIView {

    //MARK: Properties
    var rating: Int = 0
    var ratingButtons = [UIButton]()
    var starCount = 5
    let buttonSize = 44

    //MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createButtons()
    }

    //MARK: Overrides
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(startingPointOnXAxis(index))
            button.frame = buttonFrame
        }
    }

    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: buttonSize)
    }

    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }

    //MARK: Private functions
    private func startingPointOnXAxis(index: Int) -> Int {
        let spacingBetweenButtons = 5
        return index * (buttonSize + spacingBetweenButtons)
    }

    private func createButtons() {
        for _ in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = UIColor.redColor()
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            ratingButtons.append(button)
            addSubview(button)
        }
    }
}
