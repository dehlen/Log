# LogLevelFormatter

A type that formats a log level.

``` swift
public protocol LogLevelFormatter
```

## Required Properties

## colorEscape

The formatter's color escape sequence (e.g. for bash output). The default is an empty string.

``` swift
var colorEscape: String
```

## colorReset

The formatter's color escape reset sequence (e.g. for bash output). The default is an empty string.

``` swift
var colorReset: String
```

## colorEscape

``` swift
var colorEscape: String
```

## colorReset

``` swift
var colorReset: String
```

## colorEscape

``` swift
var colorEscape: String
```

## colorReset

``` swift
var colorReset: String
```

## Required Methods

## colorString(for:)

Formats a log level into a *color* string representation.

``` swift
func colorString(for level: Log.Level) -> String
```

The default values are:

  - Parameter level: the log level to format.

### Returns

A string representing the color of the formatted log level.

## labelString(for:)

Formats a log item into a *label* string representation.

``` swift
func labelString(for level: Log.Level) -> String
```

The default values are:

  - Parameter level: The log level to format.

### Returns

A string representing the label of the formatted log level.

## colorString(for:)

``` swift
func colorString(for level: Log.Level) -> String
```

## labelString(for:)

``` swift
func labelString(for level: Log.Level) -> String
```

## colorString(for:)

``` swift
func colorString(for level: Log.Level) -> String
```

## labelString(for:)

``` swift
func labelString(for level: Log.Level) -> String
```
