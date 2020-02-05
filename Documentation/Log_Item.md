# Log.Item

A log item value that represents a log message and its context.

``` swift
public struct Item: Equatable, Codable
```

## Inheritance

`Equatable`, `Codable`

## Properties

## timestamp

The timestamp when the log item was created.

``` swift
let timestamp: Date
```

## module

The module of the log item.

``` swift
let module: String?
```

## level

The severity level of the log item.

``` swift
let level: Level
```

## message

The message of the log item.

``` swift
let message: String
```

## thread

The current thread's name when the log item was created.

``` swift
let thread: String
```

## queue

The current queue's label when the log item was created.

``` swift
let queue: String
```

## file

The file from where the log originated.

``` swift
let file: String
```

## line

The file line from where the log originated.

``` swift
let line: UInt
```

## function

The function from where the log originated.

``` swift
let function: String
```
