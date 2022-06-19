import UIKit

var greeting = "Hello, playground"

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

// Code Challenge 4
let inputArray = ["alpha", "beta", "gamma"]
let outputArray = inputArray.map { $0.uppercased() }
outputArray

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

print("End of Playground - 19-Jun-2022")
