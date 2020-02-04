# MetadataLogger

A type that logs messages with multiple possible severity log levels, and sets/unsets custom logging metadata.

``` swift
public protocol MetadataLogger: Logger
```

## Inheritance

[`Logger`](Logger)

## Required Methods

## setMetadata(\_:)

Sets custom metadata in the logger, to enrich logging data (e.g. user info, device info, correlation ids, etc).

``` swift
func setMetadata(_ metadata: [MetadataKey : Any])
```

This extra information can be very handy on its own, can and also be used to correlate logs between logging
providers, for instance.

  - Parameter metadata: The custom metadata to set.

## removeMetadata(forKeys:)

Removes custom metadata from the logger, when any previous information became outdated (e.g. user signed out).

``` swift
func removeMetadata(forKeys keys: [MetadataKey])
```

> Seealso: `setMetadata(_:)`

  - Parameter keys: The custom metadata keys to remove.

## verbose(\_:file:line:function:)

Logs a `verbose` log level message alongside the file, function and line the log originated from.

``` swift
func verbose(_ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

### Parameters

  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## debug(\_:file:line:function:)

Logs a `debug` log level message alongside the file, function and line the log originated from.

``` swift
func debug(_ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

### Parameters

  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## info(\_:file:line:function:)

Logs an `info` log level message alongside the file, function and line the log originated from.

``` swift
func info(_ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

### Parameters

  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## warning(\_:file:line:function:)

Logs a `warning` log level message alongside the file, function and line the log originated from.

``` swift
func warning(_ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

### Parameters

  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## error(\_:file:line:function:)

Logs an `error` log level message alongside the file, function and line the log originated from.

``` swift
func error(_ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

### Parameters

  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## Generically Constrained Members

### where Self: MetadataLogDestination

#### setMetadata(\_:)

``` swift
func setMetadata(_ metadata: [MetadataKey : Any])
```

#### removeMetadata(forKeys:)

``` swift
func removeMetadata(forKeys keys: [MetadataKey])
```
