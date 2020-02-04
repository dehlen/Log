# LogItemFormatter

A type that formats a log item into an output format.

``` swift
public protocol LogItemFormatter
```

## Required Methods

## format(item:)

Formats a log item into an instance of the output type.

``` swift
func format(item: Log.Item) throws -> Output
```

  - Parameter item: The log item to format.

### Returns

An `Output` instance representing the formatted log item.
