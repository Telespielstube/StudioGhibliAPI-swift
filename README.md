A Swift package to access the StudioGhibliAPI website [Studio Ghibli API](https://ghibliapi.vercel.app/)


### Installation
To use this package navigate to your XCode project (the blue icon in the upper left corner in the Project navigator). In the 'General' tab scroll down to 'Framework and Libraries' and click the '+"' button'. Choose 'Add Other...' button and 'Add Package Dependency'. Now search for 'StudioGhibliAPI-swift'

### Usage
The package can be easily imported.
```swift
import StudioGhibliAPI_swift
```

### Example
This is a small example how to get all Studio Ghibli films.
```swift
import Foundation
import StudioGhibliAPI_swift

let films = try await StudioGhibliAPIQuery<Film>.getAll(endpoint: "films", type: Film.self)
print(films)
```
More examples can be found in the package folder under 'Examples'
