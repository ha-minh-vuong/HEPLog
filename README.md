A logging framework for Swift development.

### Usage

```swift
let log = HEPLog()

// Create and config logger.
let consoleLog = HEPConsoleLog()
consoleLog.logLevel = .trace

// Can add many loggers in log object.
log.add(logger: consoleLog)

// Now, you can log anywhere you want!
log.trace("log message")
// or with another log level, like
log.debug()
log.info()
log.warn()
log.error()
log.fatal()
```

HEPLog supports module log. So, in your module, you create an empty subclass of `HEPModuleLog`, and obtain the log object by `let log = HEPModuleSubClassLog.log`. A client of your module can enable or disable the log in your module by `HEPModuleSubClassLog.enable = true // or false`.

### Installation

#### CocoaPods

To intall, add the following to your `Podfile`:

```ruby
pod 'HEPLog', '~> 2.0'  
```

#### Carthage

To install, add the following to your `Cartfile`:

```ruby
github "ha-minh-vuong/HEPLog" ~> 2.0
```
