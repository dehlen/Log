# Logger

A type that logs messages with multiple possible severity log levels.

``` swift
public protocol Logger: AnyObject
```

## Inheritance

`AnyObject`

## Conforming Types

[`MetadataLogger`](MetadataLogger), [`ModuleLogger`](ModuleLogger)

## Required Methods

## log(level:message:file:line:function:)

Logs a message with the given level, alongside the file, function and line the log originated from.

``` swift
func log(level: Log.Level, message: @autoclosure () -> String, file: StaticString, line: UInt, function: StaticString)
```

### Parameters

  - level: The severity level of the message.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

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

### where Self: LogDestination

#### log(level:message:file:line:function:)

``` swift
func log(level: Log.Level, message: @autoclosure () -> String, file: StaticString, line: UInt, function: StaticString)
```
