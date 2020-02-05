# LogDestination

A type representing a logging destination (or provider).

``` swift
public protocol LogDestination: AnyObject
```

## Inheritance

`AnyObject`

## Conforming Types

[`MetadataLogDestination`](MetadataLogDestination)

## Associated Types

## ID

A type representing a destination's identifier.

``` swift
Typealias(context: Optional("LogDestination"), attributes: [], modifiers: [], keyword: "typealias", name: "ID", initializedType: Optional("String"), genericParameters: [], genericRequirements: [])
```

## Required Properties

## minLevel

The minimum log level of the destination. Any item with a level below this level shouldn't be logged.

``` swift
var minLevel: Log.Level
```

## id

The identifier of the destination. The default is the destination's type name.

``` swift
var id: ID
```

## id

``` swift
var id: ID
```

## Required Methods

## write(item:onFailure:)

Writes a log item to the destinations output (e.g. console, file, remove server, etc).

``` swift
func write(item: Log.Item, onFailure: @escaping (Error) -> Void)
```

### Parameters

  - item: The item to write.
  - onFailure: The closure to be invoked on failure.
