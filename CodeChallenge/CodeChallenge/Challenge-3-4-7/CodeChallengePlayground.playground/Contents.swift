import UIKit

var greeting = "Hello, playground"

// Code Challenge - 3: String without space
let input = "EY is the best place to work"
let output = input.replacingOccurrences(of: " ", with: "")

// Code Challenge 4
let inputArray = ["alpha", "beta", "gamma"]
let outputArray = inputArray.map { item in
    item.uppercased()
}

// Code Challenge 7
typealias Event = String
typealias EventData = (event: Event, info: Any?)
typealias EventHandler = (_ event: EventData) -> Void

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

var globalPublisher = Publisher()

var subscription = globalPublisher.subscribe(event: "hello") { event in
    let eventString = event.event
    print("HelloEventHandler: Received event: \(eventString) |  info: \(event.info ?? "No Info")")
}

globalPublisher.publish(event: "hello", info: nil)
globalPublisher.publish(event: "hello", info: "world")

var subscription2 = globalPublisher.subscribe(event: "test") { event in
    let eventString = event.event
    print("TestEventHandler: Received event: \(eventString) |  info: \(event.info ?? "No Info")")
}

globalPublisher.publish(event: "test", info: "my event")

subscription.unSubscribe()

globalPublisher.publish(event: "hello", info: nil)
globalPublisher.publish(event: "test", info: "my event - New")
