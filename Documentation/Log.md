# Log

A type representing the Log namespace (case-less enum).

``` swift
public enum Log
```

## Nested Types

  - [Log.Item](Log_Item)
  - [Log.Level](Log_Level)
  - [Log.Queue](Log_Queue)
  - Log.MultiLoggerError
  - Log.NoModule
  - Log.NoMetadataKey
  - Log.MultiLogger
  - Log.DummyLogger
  - Log.ConsoleLogDestinationError
  - Log.ConsoleLogDestination
  - Log.FileLogDestination
  - Log.FileLogDestination.FileLogDestinationError
  - Log.JSONLogItemFormatter
  - Log.StringLogItemFormatter
  - Log.BashLogLevelFormatter
  - Log.DefaultLogLevelFormatter

## Nested Type Aliases

## LogDestinationErrorClosure

A logger's log destination error callback closure, invoked whenever any of its destinations fails an
operation.

``` swift
Typealias(context: Optional("Log.MultiLogger"), attributes: [], modifiers: [public], keyword: "typealias", name: "LogDestinationErrorClosure", initializedType: Optional("((LogDestination, Error) -> Void)"), genericParameters: [], genericRequirements: [])
```

## OutputClosure

A console destination's output closure, which invokes the console printing system call.

``` swift
Typealias(context: Optional("Log.ConsoleLogDestination"), attributes: [], modifiers: [public], keyword: "typealias", name: "OutputClosure", initializedType: Optional("((Level, String) -> Void)"), genericParameters: [], genericRequirements: [])
```

## LogMetadataClosure

A console destinations' log metadata closure, which converts received metadata into a log message that is
forwared to the output closure.

``` swift
Typealias(context: Optional("Log.ConsoleLogDestination"), attributes: [], modifiers: [public], keyword: "typealias", name: "LogMetadataClosure", initializedType: Optional("([MetadataKey : Any]) -> (Level, String)"), genericParameters: [], genericRequirements: [])
```

## LogMetadataClosure

A console destinations' log metadata closure, which converts received metadata into a log message that is
forwared to the output closure.

``` swift
Typealias(context: Optional("Log.FileLogDestination"), attributes: [], modifiers: [public], keyword: "typealias", name: "LogMetadataClosure", initializedType: Optional("([MetadataKey : Any]) -> Data"), genericParameters: [], genericRequirements: [])
```

## Enumeration Cases

## duplicateDestination

A destination with the same id already registered.

``` swift
case duplicateDestination(: LogDestination.ID)
```

## inexistentDestination

A destination with the given id isn't registered.

``` swift
case inexistentDestination(: LogDestination.ID)
```

## duplicateModule

The module is already registered.

``` swift
case duplicateModule(: String)
```

## inexistentModule

The module isn't registered

``` swift
case inexistentModule(: String)
```

## itemFormatFailed

Formatting a log item failed.

``` swift
case itemFormatFailed(: Log.Item, : Error)
```

## clearFailed

The log file couldn't be cleared (removed).

``` swift
case clearFailed(: URL, : Error)
```

## itemFormatFailed

Formatting a log item failed.

``` swift
case itemFormatFailed(: Log.Item, : Error)
```

## itemWriteFailed

Writing a log item to file failed.

``` swift
case itemWriteFailed(: URL, : Log.Item, : Error)
```

## metadataWriteFailed

Writing a metadata message to file failed.

``` swift
case metadataWriteFailed(: URL, : [MetadataKey : Any], : Data, : Error)
```

## Initializers

## init?(rawValue:)

``` swift
public init?(rawValue: String)
```

## init(onError:)

Creates an instance of a logger.

``` swift
public init(onError: LogDestinationErrorClosure? = nil)
```

  - Parameter onError: The logger's log destination error callback closure.

## init(formatter:minLevel:output:logMetadata:)

Creates a new instance of a log destination that outputs logs to the console.

``` swift
public init(formatter: ItemFormatter, minLevel: Level = .error, output: @escaping OutputClosure = { level, message in print(message) }, logMetadata: LogMetadataClosure? = nil)
```

### Parameters

  - formatter: The log item formatter.
  - minLevel: The minimum severity log level. Any item with a level below this level won't be logged. The default is `.error`.
  - output: The output closure, which should be used to wrap the system call that will output to the console (e.g. `print`, `NSLog`, `os_log`, etc.). The default is `print(message)`.
  - logMetadata: The metadata logging closure. If non `nil`, any time new metadata is set it will be converted into a message that is then forwarded into the `output` closure and logged. Otherwise, no metadata is logged. The default is `nil` (no metadata logging).

## init(formatter:fileURL:fileManager:minLevel:queue:logMetadata:)

Creates a new instance of a log destination that outputs logs to a file.

``` swift
public init(formatter: ItemFormatter, fileURL: URL, fileManager: FileManager = .default, minLevel: Level = .error, queue: Queue = Queue(label: "com.davidehlen.log.destination.file"), logMetadata: LogMetadataClosure? = nil)
```

### Parameters

  - formatter: The log item formatter.
  - fileURL: The destinations's log file URL.
  - fileManager: The file manager to use for file system operations.
  - minLevel: The minimum severity log level. Any item with a level below this level won't be logged. The default is `.error`.
  - queue: The queue to perform asynchronous IO operations.
  - logMetadata: The metadata logging closure. If non `nil`, any time new metadata is set it will be converted into a message that is then forwarded into the `output` closure and logged. Otherwise, no metadata is logged. The default is `nil` (no metadata logging).

## init(formatString:levelFormatter:dateFormatter:)

Creates an instance with the given format string, log level and date formatters.

``` swift
public init(formatString: String = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M", levelFormatter: LogLevelFormatter = DefaultLogLevelFormatter(), dateFormatter: DateFormatter = DateFormatter())
```

### Parameters

  - formatString: The formatter's format string. The default is `"$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M"`
  - levelFormatter: The formatter's log level formatter. The default is an instance of `DefaultLogLevelFormatter`.
  - dateFormatter: The formatter's date formatter. The default is an empty instance of `DateFormatter`.

## init()

Creates an instance.

``` swift
public init()
```

## init(encoder:)

Creates an instance with the given encoder.

``` swift
init(encoder: JSONEncoder = JSONEncoder())
```

  - Parameter encoder: The encoder to format the items with.

## Properties

## rawValue

``` swift
let rawValue: String
```

## destinations

The logger's registered destinations. The destinations are stored as type erased versions to enable storing
multiple `MetadataLogDestination`'s with the same `MetadataKey` (read only).

``` swift
var destinations: [AnyMetadataLogDestination<MetadataKey>]
```

## modules

The logger's registered modules (read only).

``` swift
var modules: [Module : Log.Level]
```

## internalLogger

The framework's (configurable) internal logger, mostly used as a default error logger, or to log errors which
don't impact normal functioning and are not exposed/propagated via the current API's.

``` swift
var internalLogger: Logger = {

        let format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - [Log] $M"

        let formatter = Log.StringLogItemFormatter()
        let destination = Log.ConsoleLogDestination<StringLogItemFormatter, NoMetadataKey>(formatter: formatter)

        return destination
    }()
```

The default value is set to a `Log.ConsoleLogDestination` instance configured with a `StringLogItemFormatter`
with the format string: `"$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - [Log] $M"`.

Set to a `Log.DummyLogger` instance to disable logging from the framework, or to the `Logger` of your choice to
easily include Alicerce's logs into to your own logs.

> Warning: This variable is **not** thread safe (for performance reasons). If you wish to customize its value please do so just once on app launch, or before using any of Alicerce's components.

## formatter

The destination's log item formatter.

``` swift
let formatter: ItemFormatter
```

## minLevel

The destination's minimum severity log level.

``` swift
let minLevel: Level
```

## formatter

The destination's log item formatter.

``` swift
let formatter: ItemFormatter
```

## minLevel

The destination's minimum severity log level.

``` swift
let minLevel: Level
```

## id

The destination's id, defaulting to the destination's type name concatenated with the log file's absolute
URL.

``` swift
var id: String = "\(type(of: self))_\(fileURL.absoluteString)"
```

## formatString

The formatter's format string.

``` swift
let formatString: String
```

## dateFormatter

The formatter's date formatter.

``` swift
let dateFormatter: DateFormatter
```

## levelFormatter

The formatters log level formatter.

``` swift
let levelFormatter: LogLevelFormatter
```

## colorEscape

``` swift
var colorEscape = "\u{001b}[38;5;"
```

## colorReset

``` swift
var colorReset = "\u{001b}[0m"
```

## output

The destination's output closure. Should be used to wrap a call to `print`, `NSLog`, `os_log`, etc.

``` swift
let output: OutputClosure
```

> Note: Is invoked synchronously. This shouldn't be a problem or limitation if using one of the above system calls, since they're all thread safe.

## logMetadata

The destination's log metadata closure. When set, any time new metadata is set it will be converted into a
message that is then forwarded into the `output` closure and logged. If `nil`, no metadata is logged.

``` swift
let logMetadata: LogMetadataClosure?
```

## fileURL

The log file's URL.

``` swift
let fileURL: URL
```

## fileManager

The file manager.

``` swift
let fileManager: FileManager
```

## queue

The destination's synchronous queue.

``` swift
let queue: Queue
```

## logMetadata

The destination's log metadata closure. When set, any time new metadata is set it will be converted into a
message that is then written to the log gile. If `nil`, no metadata is logged.

``` swift
let logMetadata: LogMetadataClosure?
```

## encoder

The formatter's JSON encoder.

``` swift
let encoder: JSONEncoder
```

## Methods

## registerDestination(\_:)

Registers a destination in the logger, and starts sending any new logging events to it.
This method is thread safe.

``` swift
public func registerDestination<D: MetadataLogDestination>(_ destination: D) throws where D.MetadataKey == MetadataKey
```

  - Parameter destination: The log destination to register.

### Throws

A `MultiLoggerError.duplicateDestination` error if a destination with the same `id` is already registered.

## unregisterDestination(\_:)

Unregisters a destination from the logger, preventing any new logging events from being sent to it.

``` swift
public func unregisterDestination<D: MetadataLogDestination>(_ destination: D) throws where D.MetadataKey == MetadataKey
```

  - Parameter destination: The log destination to unregister.

### Throws

A `MultiLoggerError.inexistentDestination` error if a destination with the same `id` isn't registered.

## registerModule(\_:minLevel:)

Registers a module in the logger with a minimum severity log level, taking it into account when filtering
any new log messages (if using the `ModuleLogger`'s `log` API, i.e. *with* `module` parameter).

``` swift
public func registerModule(_ module: Module, minLevel: Level) throws
```

> Note: Module filtering works as follows:

A log message having a module parameter will only be logged *if the module is registered* in the logger, and
the log message's level is *above* the module's registered minimum log level. On the other hand, if the
message is logged without module (i.e. using the `Logger`'s `log` API, i.e. *without* `module` parameter),
no module filtering will be made.

### Parameters

  - module: The module to be registered.
  - minLevel: The minimum severity level required to be logged by the module.

### Throws

A `MultiLoggerError.duplicateModule` error if a module with the same `rawValue` is already registered.

## unregisterModule(\_:)

Unregisters a module from the logger, taking it into account when filtering any new log messages (if logged
using the `ModuleLogger`'s `log` API, i.e. *with* `module` parameter).

``` swift
public func unregisterModule(_ module: Module) throws
```

> Seealso: `registerModule(_:minLevel:)`

  - Parameter module: The module to be unregistered.

### Throws

A `MultiLoggerError.inexistentModule` error if a module with the same `rawValue` isn't registered.

## log(module:level:message:file:line:function:)

Logs a message from the specified module with the given level, alongside the file, function and line the
log originated from.

``` swift
public func log(module: Module, level: Log.Level, message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: The message will only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level.

### Parameters

  - module: The module from which the message originated.
  - level: The severity level of the message.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## log(level:message:file:line:function:)

Logs a message from the specified module (if non `nil`) with the given level, alongside the file, function
and line the log originated from.

``` swift
public func log(level: Log.Level, message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line, function: StaticString = #function)
```

> Note: If the `module` parameter is non `nil`, the message will only be logged if the module is registered in the logger, and the log message's level is *above* the module's registered minimum log level. On the other hand, if `module` is set to `nil`, no module filtering will be applied.

### Parameters

  - module: The module from which the message originated. Set to `nil` for no module filtering.
  - level: The severity level of the message.
  - message: The log message.
  - file: The file from where the log was invoked.
  - line: The line from where the log was invoked.
  - function: The function from where the log was invoked.

## setMetadata(\_:)

Sets custom metadata in the logger's destinations, to enrich logging data (e.g. user info, device info,
correlation ids, etc).

``` swift
public func setMetadata(_ metadata: [MetadataKey : Any])
```

This extra information can be very handy on its own, can and also be used to correlate logs between logging
providers, for instance.

  - Parameter metadata: The custom metadata to set.

## removeMetadata(forKeys:)

Removes custom metadata from the logger's destinations, when any previous information became outdated (e.g.
user signed out).

``` swift
public func removeMetadata(forKeys keys: [MetadataKey])
```

> Seealso: `setMetadata(_:)`

  - Parameter keys: The custom metadata keys to remove.

## log(level:message:file:line:function:)

``` swift
public func log(level: Log.Level, message: @autoclosure () -> String, file: StaticString, line: UInt, function: StaticString)
```

## write(item:onFailure:)

Writes a log item to the console output, after being successfully formatted by the item formatter.

``` swift
public func write(item: Log.Item, onFailure: @escaping (Error) -> Void)
```

### Parameters

  - item: The item to write.
  - onFailure: The closure to be invoked on failure (if the formatter fails).

## setMetadata(\_:onFailure:)

Sets custom metadata by logging it to the console if `logMetadata` is **non nil**, to enrich existing log
data (e.g. user info, device info, correlation ids, etc).

``` swift
public func setMetadata(_ metadata: [MetadataKey : Any], onFailure: @escaping (Error) -> Void)
```

This extra information can be very handy on its own, can and also be used to correlate logs between logging
providers, for instance.

### Parameters

  - metadata: The custom metadata to set.
  - onFailure: The closure to be invoked on failure.

## removeMetadata(forKeys:onFailure:)

This method has an empty implementation because metadata is logged to console, and thus can't be removed
after being logged to the console.

``` swift
public func removeMetadata(forKeys keys: [MetadataKey], onFailure: @escaping (Error) -> Void)
```

### Parameters

  - keys: The custom metadata keys to remove.
  - onFailure: The closure to be invoked on failure.

## clear()

Clears the destination's log file, by deleting the file. The file is recreated on write if needed.

``` swift
public func clear() throws
```

### Throws

A `FileLogDestinationError.clearFailed` error if the file couldn't be cleared (removed).

## write(item:onFailure:)

Writes a log item to the log file, after being successfully formatted by the item formatter.

``` swift
public func write(item: Item, onFailure: @escaping (Error) -> Void)
```

### Parameters

  - item: The item to write.
  - onFailure: The closure to be invoked on failure (if the formatter or disk IO fail).

## setMetadata(\_:onFailure:)

Sets custom metadata by logging it to the console if `logMetadata` is **non nil**, to enrich existing log
data (e.g. user info, device info, correlation ids, etc).

``` swift
public func setMetadata(_ metadata: [MetadataKey : Any], onFailure: @escaping (Error) -> Void)
```

This extra information can be very handy on its own, can and also be used to correlate logs between logging
providers, for instance.

### Parameters

  - metadata: The custom metadata to set.
  - onFailure: The closure to be invoked on failure.

## removeMetadata(forKeys:onFailure:)

This method has an empty implementation because metadata is logged to file, and thus can't easily be removed
after being logged.

``` swift
public func removeMetadata(forKeys keys: [MetadataKey], onFailure: @escaping (Error) -> Void)
```

### Parameters

  - keys: The custom metadata keys to remove.
  - onFailure: The closure to be invoked on failure.

## format(item:)

Formats a log item into a binary encoded JSON.

``` swift
public func format(item: Item) throws -> Data
```

  - Parameter item: The log item to format.

### Throws

An error if the JSON encoding fails.

### Returns

A binary encoded JSON representing the formatted log item.

## format(item:)

``` swift
public func format(item: Item) throws -> String
```

  - Parameter item: The log item to format.

### Returns

A binary encoded JSON representing the formatted log item.

## colorString(for:)

``` swift
public func colorString(for level: Level) -> String
```

## write(data:)

Writes log data to the log file.

``` swift
private func write(data: Data) throws
```

  - Parameter data: The data to write.

### Throws

An error if the write fails, or the file handle can't be created.

## formatDate(\_:dateFormat:)

``` swift
private func formatDate(_ date: Date, dateFormat: String) -> String
```

## formatFileName(withSuffix:)

``` swift
private func formatFileName(withSuffix file: String) -> String
```

## formatFileName(withoutSuffix:)

``` swift
private func formatFileName(withoutSuffix file: String) -> String
```
