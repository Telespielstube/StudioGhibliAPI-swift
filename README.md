A Swift package to access the StudioGhibliAPI website [Studio Ghibli API](https://ghibliapi.vercel.app/)


### Installation

### Usage

```swift
import Foundation
import StudioGhibliAPI_swift

let ghibli = StudioGhibliAPI()
let films = try await ghibli.query.getAll(endpoint: "films", type: Film.self)
```
