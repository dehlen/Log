# MetadataLogDestination

A type representing a logging destination (or provider) that can set/unset custom logging metadata.

``` swift
public protocol MetadataLogDestination: LogDestination
```

## Inheritance

[`LogDestination`](LogDestination)

## Conforming Types

[`AnyMetadataLogDestination`](AnyMetadataLogDestination)

## Required Properties

## id

``` swift
var id: ID
```

## Required Methods

## setMetadata(\_:onFailure:)

Sets custom metadata in the destination, to enrich existing log data (e.g. user info, device info, correlation
ids, etc).

``` swift
func setMetadata(_ metadata: [MetadataKey : Any], onFailure: @escaping (Error) -> Void)
```

This extra information can be very handy on its own, can and also be used to correlate logs between logging
providers, for instance.

### Parameters

  - metadata: The custom metadata to set.
  - onFailure: The closure to be invoked on failure.

## removeMetadata(forKeys:onFailure:)

Removes custom metadata from the destination.

``` swift
func removeMetadata(forKeys keys: [MetadataKey], onFailure: @escaping (Error) -> Void)
```

### Parameters

  - keys: The custom metadata keys to remove.
  - onFailure: The closure to be invoked on failure.
