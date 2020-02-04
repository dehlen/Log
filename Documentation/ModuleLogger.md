# ModuleLogger

A type that logs messages with multiple possible severity levels, originating from configurable app modules.

``` swift
public protocol ModuleLogger: Logger
```

## Inheritance

[`Logger`](Logger)

## Required Methods

## log(module:level:message:file:line:function:)

Logs a message from the specified module with the given level, alongside the file, function and line the log
originated from.

``` swift
func log(module: Module, level: Log.Level, message: @autoclosure () -> String, file: StaticString, line: UInt, function: StaticString)
```

> Note: The message should only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - level: The severity level of the message.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## registerModule(\_:minLevel:)

Registers a module in the logger with a minimum severity log level, taking it into account when filtering
any new log messages (if using the `ModuleLogger`'s `log` API, i.e. *with* `module` parameter).

``` swift
func registerModule(_ module: Module, minLevel: Log.Level) throws
```

> Note: Module filtering works as follows:

A log message having a module parameter should only be logged *if the module is registered* in the logger, and
the log message's level is *above* the module's registered minimum log level. On the other hand, if the message
is logged without module (i.e. using the `Logger`'s `log` API, i.e. *without* `module` parameter), no module
filtering should be made.

### Parameters

  - module: The module to be registered.
  - minLevel: The minimum severity level required to be logged by the module.

## unregisterModule(\_:)

Unregisters a module from the logger, taking it into account when filtering any new log messages (if logged
using the `ModuleLogger`'s `log` API, i.e. *with* `module` parameter).

``` swift
func unregisterModule(_ module: Module) throws
```

> Seealso: `registerModule(_:minLevel:)`

  - Parameter module: The module to be unregistered.

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

## verbose(\_:\_:file:line:function:)

Logs a `verbose` log level message from the specified module, alongside the file, function and line the log
originated from.

``` swift
func verbose(_ module: Module, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: The message should only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## debug(\_:\_:file:line:function:)

Logs a `debug` log level message from the specified module, alongside the file, function and line the log
originated from.

``` swift
func debug(_ module: Module, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: The message should only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## info(\_:\_:file:line:function:)

Logs an `info` log level message from the specified module, alongside the file, function and line the log
originated from.

``` swift
func info(_ module: Module, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: The message should only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## warning(\_:\_:file:line:function:)

Logs a `warning` log level message from the specified module, alongside the file, function and line the log
originated from.

``` swift
func warning(_ module: Module, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: The message should only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## error(\_:\_:file:line:function:)

Logs an `error` log level message from the specified module, alongside the file, function and line the log
originated from.

``` swift
func error(_ module: Module, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: The message should only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## verbose(\_:\_:file:line:function:)

Logs a `verbose` log level message from the specified module, alongside the file, function and line the log
originated from.

``` swift
func verbose(_ module: Module, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: The message should only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## debug(\_:\_:file:line:function:)

Logs a `debug` log level message from the specified module, alongside the file, function and line the log
originated from.

``` swift
func debug(_ module: Module, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: The message should only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## info(\_:\_:file:line:function:)

Logs an `info` log level message from the specified module, alongside the file, function and line the log
originated from.

``` swift
func info(_ module: Module, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: The message should only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## warning(\_:\_:file:line:function:)

Logs a `warning` log level message from the specified module, alongside the file, function and line the log
originated from.

``` swift
func warning(_ module: Module, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: The message should only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## error(\_:\_:file:line:function:)

Logs an `error` log level message from the specified module, alongside the file, function and line the log
originated from.

``` swift
func error(_ module: Module, _ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: The message should only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## Generically Constrained Members

### where Self: LogDestination

#### log(module:level:message:file:line:function:)

``` swift
func log(module: Module, level: Log.Level, message: @autoclosure () -> String, file: StaticString, line: UInt, function: StaticString)
```
