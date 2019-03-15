# Swift Codable Examples

Codable was implemented in Swift 4, and made available starting in Xcode 9.0.

For more history details, see swift evolution: [SE-0166](https://github.com/apple/swift-evolution/blob/master/proposals/0166-swift-archival-serialization.md)

## Codable
```swift
public typealias Codable = Decodable & Encodable
```

## Decodable
```swift
public protocol Decodable {
    public init(from decoder: Decoder) throws
}
```

## Encodable
```swift
public protocol Encodable {
    public func encode(to encoder: Encoder) throws
}
```

## Supported File Formats
* JSON
* Property List (.plist)

## JSON Examples

### Simple
```json
{
  "first": "Steve",
  "last": "Dave",
  "age": 45,
  "isFriendly": true,
  "rating": "*****"
}
```

### Nested
```json
{
  "age": 45,
  "name": {
    "first": "Steve",
    "last": "Dave"
  }
}
```

### Array
```json
{
  "strings": ["Red", "Green", "Blue"],
  "numbers": [1, 3, 5, 7, 9],
  "bools": [true, true, false]
}
```

### Common
```json
{
  "first-name": "Steve",
  "last-name": "Dave"
}
```

### Tuple
```json
{
  "dimension": [ 16, 9 ]
}
```

### Hierarchy
```json
{
  "shipping-address": {
    "name": "Detroit Labs",
    "city": "Detroit",
    "state": "MI"
  },
  "billing-address": {
    "name": "Paula Goodski",
  },
  "items": [
    { "sku": "I001", "name": "Labs Beats V1", "quantity": 10000 }
  ]
}
```

## Inheritance
```json
{
  "cat": {
    "name": "Fluffy",
    "lenghtOfTail": 6
  },
  "dog": {
    "name": "Skippy",
    "numberOfBones": 1
  }
}
```

## Advanced JSON Examples

### Option Set
```json
{
  "sports": [ "swimming", "running" ]
}
```

### Inconvenient Array
```json
{
  "item.3": "Delta",
  "item.0": "Alfa",
  "item.2": "Charlie",
  "item.1": "Bravo"
}
```
