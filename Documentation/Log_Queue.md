# Log.Queue

A queue object used to specify `DispatchQueue`'s used in log destinations, ensuring they are serial with the
specified QoS, targeting an optional queue.

``` swift
public final class Queue
```

## Initializers

## init(label:qos:target:)

Creates an instance with the specified label, QoS and target queue.

``` swift
public init(label: String, qos: DispatchQoS = .utility, target: DispatchQueue? = nil)
```

### Parameters

  - label: The inner dispatch queue's label.
  - qos: The inner dispatch queue's quality of service.
  - target: The inner dispatch queue's target queue.

## Properties

## dispatchQueue

The inner GCD queue.

``` swift
let dispatchQueue: DispatchQueue
```
