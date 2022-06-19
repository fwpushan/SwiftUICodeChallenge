# Swift / iOS Code Challenge

This repository contains some code example of latest iOS and Swift.

## Contents

1. [System Requirements](#system-requirements)
1. [How to run](#how-to-run)
1. [Challenge 1](#challenge-1)
1. [Challenge 2](#challenge-2)
1. [Challenge 3](#challenge-3)
1. [Challenge 4](#challenge-4)
1. [Challenge 5](#challenge-5)
1. [Challenge 6](#challenge-6)
1. [Challenge 7](#challenge-7)

## System Requirements

- **macOS Monterey (v12.4)**

- **XCode v13.4.1**

- **Swift 5.5**

## How to run

This code examples are tested on **iOS 15.1** **iPod 7 Generation** simulator.

- Open `CodeChallenge.xcworkspace` in Xcode

- Build Application (CMD + B)

- Select target simulator and run application (CMD + R)

## Code Challenges

Most of the code examples are implemented as part of Single View UIKit based iOS application.

The initial view controller (ViewController.swift) is used as index page to invoke different code examples

![IndexView](/assets/IndexView.png)

### Challenge 1

```text

Your client has a need to asynchronously communicate with a third-party service.  This serice is at url http://ip.jsontest.com/.  The request is a GET.  The request requires no payload.  The response will be similar to the following json {"ip": "11.11.11.11"}.  Make a call to this service without blocking the application and display the results in the application log.
Create an asynchronous request to request data from the endpoint.  Ensure you do not block the user interface.  Print result to log.  Update user interface label with result.  Include appropriate error handling.

Please provide two different approaches.

- Async / await pattern
- Closure callback pattern
```

The code example is implemented in `Challenge-1/ApiCall.swift` and invoked
in `ViewController.swift` by clicking

- `API call with Closure` (Closure based)

- `API call with Async` (Async / await pattern)

```swift
@IBAction func apiAction(_ sender: Any) {}
```

```swift
@IBAction func apiActionWithAsync(_ sender: Any) {}
```

### Challenge 2

```txt
Create a segmented controller with six color options.  As the different segments are selected, change the color of the segment to the color selected.  Make sure to update the user interface color in the correct thread.

Please provide two different approaches.

- UIKit
- SwiftUI

```

The UIKit version of the solution is implemented in `ColorSelectionViewController.swift` using storyboard and invoked through
`ViewController.swift` by the button click `UIKit Color Selection`

```swift
@IBAction func showUIKitColorSelector(_ sender: Any) {}
```

SwiftUI version of code example is implemented in `ColorSelectSwiftUIView.swift` and user can view this screen through `ViewController.swift` / `SwiftUI Color Select` button

```swift
    @IBAction func showSwiftUIColorSelectView(_ sender: Any) {}
```

### Challenge 3

```txt
Create a method that will take in string and return the same string without any spaces.  For example “EY is the best place to work.” would be returned as “EYisthebestplacetowork.”  Do this without the use of string methods like replacingOccurrences.  We want to see you manipulate the string directly.
```

The code example is implemented in `Challenge-3-4-7/CodeChallengePlayground.playground`

```swift
// Code Challenge - 3: String without space
// Manipulating String as Array of sub strings
func withoutSpace(input: String) -> String {
    return input.split(separator: " ").joined()
}

// Iterating String as Sequence of Characters creating new Sequence with Space char
func withoutSpaceV2(input: String) -> String {
    var result: [Character] = []
    for ch in input {
        if ch != " " {
            result.append(ch)
        }
    }
    return String(result)
}

// Manipulating String as array of characters and filtering space
func withoutSpaceV3(input: String) -> String {
    return String(Array(input).filter { $0 != " "})
}
let input = "EY is the best place to work."
let output1 = withoutSpace(input: input)
let resultIsMatching1 = output1 == "EYisthebestplacetowork."
let output2 = withoutSpaceV2(input: input)
let resultIsMatching2 = output2 == "EYisthebestplacetowork."
let output3 = withoutSpaceV3(input: input)
let resultIsMatching3 = output3 == "EYisthebestplacetowork."
```

### Challenge 4

```txt
Use the best pattern to return the following array string as an array of uppercase strings. [“alpha”, “beta”, “gamma”]  There is a way to accomplish this with one line of code.
```

The code example is implemented in `Challenge-3-4-7/CodeChallengePlayground.playground`

```swift
// Code Challenge 4
let inputArray = ["alpha", "beta", "gamma"]
let outputArray = inputArray.map { $0.uppercased() }
```

Screenshot of Playground
![Playground](/assets/Challenge-3-4.png)

### Challenge 5

```txt
Create a view controller segue that shows a new view controller with the EY logo centered regardless of the size device used.  Make sure you have a back button to return to the original view controller.

Please provide three different approaches.
- Interface Builder
- UIKit
- SwiftUI
```

All three solution is implemented in _Group_ `Challenge-5-6`

#### Interface Builder Example

The example is implemented by `LogoIBViewController.swift`, interface is developed in `Main.storyboard`. View is presented with `UIKit IB Logo` button action of `ViewController.swift`

![ScreenShot-IB](/assets/Challenge-5-IB.png)

#### UIKit

This UIKit version of the solution is implemented by programmatically view creation in `LogoUIKViewController.swift`

```swift
func createImageView() {
        let image: UIImage = #imageLiteral(resourceName: "ey")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 2, height: 120)
        imageView.contentMode = .scaleAspectFit
        imageView.tag = imageViewTag
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        let xConstraint = NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0);
        let yConstraint = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120)
        let heightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120)
        self.view.addConstraint(xConstraint)
        self.view.addConstraint(yConstraint)
        imageView.addConstraint(widthConstraint)
        imageView.addConstraint(heightConstraint)
        self.view?.layoutSubviews()
    }
```

![ScreenShot-UIK](/assets/Challenge-5-UIK.png)

#### SwiftUI

The SwiftUI version is implemented in `LogoSwiftView.swift` and view is presented from `SwiftUI Logo` button action of `ViewController.swift`

```swift
struct ContentView: View {
    var body: some View {
        Image("ey")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 120, height: 120, alignment: .center)
            .border(Color.blue, width: 3.0)
            .clipped()
    }
}
```

![ScreenShot-SW](/assets/Challenge-5-SwiftUI.png)

### Challenge 6

```txt
Use code only (no Interface Builder or xib) to create a view controller segue that shows a new view controller with the EY logo centered regardless of the size device used.  Make sure you have a back button to return to the original view controller.

Please provide two different approaches.
- UIKit
- SwiftUI
```

#### UIKit Version

In the `ViewController.swift` on touch up of `Logo View Segue` action, the previously created `LogoUIKViewController.swift` controller is presented programmatically.

```swift
// Code Challenge 6
    @IBAction func showLogoViewProgrammatically(_ sender: Any) {
        self.performSegue(withIdentifier: "showLogoView", sender: self)
    }
```

#### SwiftUI Version

In the `ViewController.swift` on touch up of `SwiftUI Logo` action, the previously created `LogoUIKViewController.swift` controller is presented programmatically.

```swift
@IBAction func showSwiftUILogoViewController(_ sender: Any) {
        let logoView: ContentView = ContentView()
        self.navigationController?.pushViewController(UIHostingController(rootView: logoView), animated: true)
    }
```

### Challenge 7

```txt
Demonstrate your understanding of Combine’s Publisher and Subscriber by creating a simple publisher that you can subscribe to.  After subscribing, demonstrate that you receive and respond to events (write to debug log) and that you can cancel the subscription if desired.
```

The code example is implemented in `Challenge-3-4-7/CodeChallengePlayground.playground`

```swift
// Code Challenge 7

// Event type
typealias Event = String
// Event param tuple
typealias EventData = (event: Event, info: Any?)
// Event callback closure type
typealias EventHandler = (_ event: EventData) -> Void

// Class ref to store event handler
class ListenerRef {
    var eventHandlerRef: EventHandler?
    
    init(handler: @escaping EventHandler) {
        self.eventHandlerRef = handler
    }
    
    func unSubscribe() {
        print("unsubscribing")
        self.eventHandlerRef = nil
    }
}

// Publisher
struct Publisher {
    var listeners: [Event : [ListenerRef]] = [:]
    
    mutating func subscribe(event: Event,_ handler: @escaping EventHandler) -> ListenerRef {
        var eventListeners: [ListenerRef] = self.listeners[event] ?? []
        let listenerRef = ListenerRef(handler: handler)
        eventListeners.append(listenerRef)
        self.listeners[event] = eventListeners
        return listenerRef
    }
    
    func publish(event: Event, info: Any?) {
        // Get listener
        let eventListeners: [ListenerRef] = self.listeners[event] ?? []
        for listener in eventListeners {
            if let handler: EventHandler = listener.eventHandlerRef {
                handler((event, info))
            } else {
                print("subscription removed")
            }
        }
    }
}

// Global publisher obj
var globalPublisher = Publisher()

// Subscription to "hello" event
var subscription = globalPublisher.subscribe(event: "hello") { event in
    let eventString = event.event
    print("HelloEventHandler: Received event: \(eventString) |  info: \(event.info ?? "No Info")")
}

// Publishing "hello" event without data
globalPublisher.publish(event: "hello", info: nil)
// Publishing "hello" event with data
globalPublisher.publish(event: "hello", info: "world")

// Subscription to "test" event
var subscription2 = globalPublisher.subscribe(event: "test") { event in
    let eventString = event.event
    print("TestEventHandler: Received event: \(eventString) |  info: \(event.info ?? "No Info")")
}

// Publishing test event
globalPublisher.publish(event: "test", info: "my event")

// Unsubscribing: "hello event"
subscription.unSubscribe()

globalPublisher.publish(event: "hello", info: nil)
globalPublisher.publish(event: "test", info: "my event - New")
```

![Challenge-7](/assets/Challenge-7.png)