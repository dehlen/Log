# AnyMetadataLogDestination

A type-erased logging destination (or provider) that can set/unset custom logging metadata.

``` swift
public final class AnyMetadataLogDestination<MetadataKey: Hashable>: MetadataLogDestination
```

## Inheritance

[`MetadataLogDestination`](MetadataLogDestination)

## Initializers

## init(\_:)

Creates a type-erased instance of a log destination that wraps the given instance.

``` swift
public init<D: MetadataLogDestination>(_ destination: D) where D.MetadataKey == MetadataKey
```

### Parameters

  - destination: The log destination to erase the type of.

## Properties

## minLevel

The type-erased destination's wrapped instance minimum severity log level.

``` swift
let minLevel: Log.Level
```

## id

The type-erased destination's wrapped instance identifier.

``` swift
let id: ID
```

## Methods

## write(item:onFailure:)

Writes a log item to the wrapped log destination's output (e.g. console, file, remove server, etc).

``` swift
public func write(item: Log.Item, onFailure: @escaping (Error) -> Void)
```

### Parameters

  - item: The item to write.
  - onFailure: The closure to be invoked on failure.

## setMetadata(\_:onFailure:)

Sets custom metadata in the wrapped log destination, to enrich existing log data (e.g. user info, device info,
correlation ids, etc).

``` swift
public func setMetadata(_ metadata: [MetadataKey : Any], onFailure: @escaping (Error) -> Void)
```

This extra information can be very handy on its own, can and also be used to correlate logs between logging
providers, for instance.

### Parameters

  - metadata: The custom metadata to set.
  - onFailure: The closure to be invoked on failure.

## removeMetadata(forKeys:onFailure:)

Removes custom metadata from the wrapped log destination.

``` swift
public func removeMetadata(forKeys keys: [MetadataKey], onFailure: @escaping (Error) -> Void)
```

### Parameters

  - keys: The custom metadata keys to remove.
  - onFailure: The closure to be invoked on failure.
