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
* [JSON](#json-examples)
* [Property List (.plist)](#property-list-examples)

## JSON Examples

### Simple
```json
{
  "first": "Steve",
  "last": "Dave"
}
```
- Implementation: [Name.swift](Codable/Source/Name.swift),
[AnotherName.swift](Codable/Source/AnotherName.swift)
- Tests: [NameTests.swift](CodableTests/Source/NameTests.swift),
[AnotherNameTests.swift](CodableTests/Source/AnotherNameTests.swift)

```json
{
  "name": "Gizmo",
  "kind": "dog",
  "age": 14,
  "isFriendly": true
}
```
- Implementation: [Pet.swift](Codable/Source/Pet.swift)
- Tests: [PetTests.swift](CodableTests/Source/PetTests.swift)

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
- Implementation: [Person.swift](Codable/Source/Person.swift)
- Tests: [PersonTests.swift](CodableTests/Source/PersonTests.swift)

### Array
```json
{
  "strings": ["Red", "Green", "Blue"],
  "numbers": [1, 3, 5, 7, 9],
  "bools": [true, true, false]
}
```
- Tests: [ArrayTests.swift](CodableTests/Source/ArrayTests.swift),
[NameTests.swift](CodableTests/Source/NameTests.swift)

### Common
```json
{
  "first-name": "Steve",
  "last-name": "Dave"
}
```
- Implementation: [Contact.swift](Codable/Source/Contact.swift)
- Tests: [ContactTests.swift](CodableTests/Source/ContactTests.swift)

### Tuple
```json
{
  "dimension": [ 16, 9 ]
}
```
- Implementation: [Size.swift](Codable/Source/Size.swift)
- Tests: [SizeTests.swift](CodableTests/Source/SizeTests.swift)

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
- Implementation: [Invoice.swift](Codable/Source/Invoice.swift),
[Address.swift](Codable/Source/Address.swift),
[Item.swift](Codable/Source/Item.swift)
- Tests: [InvoiceTests.swift](CodableTests/Source/InvoiceTests.swift)

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
- Implementation: [Animal.swift](Codable/Source/Animal.swift),
[Cat.swift](Codable/Source/Cat.swift),
[Dog.swift](Codable/Source/Dog.swift)
- Tests: [AnimalTests.swift](CodableTests/Source/AnimalTests.swift),
[CatTests.swift](CodableTests/Source/CatTests.swift),
[DogTests.swift](CodableTests/Source/DogTests.swift)

### Option Set
```json
{
  "sports": [ "swimming", "running" ]
}
```
- Implementation: [Sports.swift](Codable/Source/Sports.swift)
- Tests: [SportsTests.swift](CodableTests/Source/SportsTests.swift)

### Inconvenient Array
```json
{
  "item.3": "Delta",
  "item.0": "Alfa",
  "item.2": "Charlie",
  "item.1": "Bravo"
}
```
- Implementation: [InconvenientArray.swift](Codable/Source/InconvenientArray.swift)
- Tests: [InconvenientArrayTests.swift](CodableTests/Source/InconvenientArrayTests.swift)

### Date With Time (ISO8601)
```json
{
  "origin": "Atlanta, GA",
  "departure": "2019-03-28T08:15:02Z",
  "destination": "Detroit, MI",
  "arrival": "2019-04-01T18:45:20Z"
}
```
- Implementation: [Trip.swift](Codable/Source/Trip.swift)
- Tests: [TripTests.swift](CodableTests/Source/TripTests.swift)

### Date Without Time
```json
{
  "origin": "Atlanta, GA",
  "departure": "2019-03-28",
  "destination": "Detroit, MI",
  "arrival": "2019-04-01"
}
```
- Implementation: [Trip.swift](Codable/Source/Trip.swift)
- Tests: [TripTests.swift](CodableTests/Source/TripTests.swift)

### Empty Collection
```json
{
  "mother": {
    "first-name": "Anne",
    "last-name": "Dave"
  },
  "father": {
    "first-name": "Steve",
    "last-name": "Dave"
  },
  "brother": {
  }
}
```
- Resources: [NilOnEmpty.swift](Codable/Source/NilOnEmpty.swift),
[RawCodingKeys.swift](Codable/Source/RawCodingKeys.swift)
- Implementation: [AnotherFamily.swift](Codable/Source/AnotherFamily.swift),
[CorruptFamily.swift](Codable/Source/CorruptFamily.swift),
[Family.swift](Codable/Source/Family.swift)
- Tests: [AnotherFamilyTests.swift](CodableTests/Source/AnotherFamilyTests.swift),
[CorruptFamilyTests.swift](CodableTests/Source/CorruptFamilyTests.swift)

## Property List Examples

### Simple
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>first</key>
    <string>Steve</string>
    <key>last</key>
    <string>Dave</string>
  </dict>
</plist>
```
- Implementation: [Name.swift](Codable/Source/Name.swift)
- Tests: [NameTests.swift](CodableTests/Source/NameTests.swift)

### Nested
```json
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>age</key>
    <integer>45</integer>
    <key>name</key>
    <dict>
      <key>first</key>
      <string>Steve</string>
      <key>last</key>
      <string>Dave</string>
    </dict>
  </dict>
</plist>
```
- Implementation: [Person.swift](Codable/Source/Person.swift)
- Tests: [PersonTests.swift](CodableTests/Source/PersonTests.swift)
