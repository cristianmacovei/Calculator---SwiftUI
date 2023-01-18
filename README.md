# Calculator---SwiftUI
This is the exact same (looking and functioning) app, but made using SwiftUI.

Instead of a tableView that uses delegate methods, I implemented a VStack and 5 HStacks to represent the dials made of numbers and basic operators.

The functionality is reduced, keeping it simple, it is built to explore the ways to make it not crash. 

As opposed to the UIKit version, this uses a single didPressNumber to recognize numbers tapped. Same for operators. The Labels themselves have the value of the number/operator as text, which will be parsed to the textfield that will display the operations. 

To failproof it, I implemented the same validInput() method and I formatted the result in the didPressEquals() function.

I tend to start to like SwiftUI more, as it does offer the ability to quickly code the interface, letting you "worry" more about the functionality and implementation of the algorithms. Also the declaration of different objects can be easily made with separate SwiftUI files, which implement these objects as structs, holding their own parameters and functions, that can be called later when declaring these in the body of the ContentView.

