# Color Cauldron

## Disclaimer

Consider viewing this README on Xcode, if possible. I plan to implement markdown features that only work on Xcode for a customized experience :D

## Process

Color Cauldron is a color manipulation desktop application for MacOS. Well, actually, I went for this project without too much thought. I like colors, and I wanted to practice a bit of AppKit, ApplicationKit, Cocoa, MacOS, OS X (did I forget any?) development.

I know desktop applications are out of fashion nowadays, but I can't help but like them. They look so robust, don't need an internet connection, provide an immersive experience, etc. That's what I feel, at least.

I didn't research about colors before starting this project because I was eager to start, and I don't even know if this app has or will have any practical use. But man, they sure are not simple. I thought I could translate all color representation models into RGB to make my job easier, but there are things like color spaces, color models, gamuts, etc, etc. 

For example, the sRGB color space, which uses the RGB color model, has a gamut (color range) that doesn't cover all the colors the human eye can see. So it's not possible to just translate every other representation to it. Still, the monitors we have can only display in RGB because of how they work. It's tough.

## App 

Well, that's enough about the process. Let's talk about the app:

In Color Cauldron, you can choose a color using the default MacOS Color Panel, and the color you have selected will color the app's circle. This is a document based app, so you can save and load files which store the color you had selected before you saved the file. It's as simple as that.

## Future

This is not a serious project, so I'm planning to do what I feel like doing. I've thought about adding info about the selected color, like ways to represent them using different color models and notations. Maybe also adding opposite color in color wheel, or anything that might be useful.

One cool idea, which is foreshadowed by the project's name, would be to have a way to mix different colors in different ways, something like layer modes in image editing softwares. Burn, Multiply, Addictive, Subtractive, etc (I don't know if those even makes sense, aside from addictive and subtractive).

## Conclusion

It has been a fun project, besides some problems: it's harder to find solutions to problems in AppKit compared to UIKit, and when you find those, they can be modelled after objective-c, instead of Swift. In fact, the AppKit framework is based around objective-c, so there are some discrepancies here and there. For example, there's a really useful thing in Cocoa called [`Cocoa Bindings`](https://developer.apple.com/documentation/appkit/cocoa_bindings), but I couldn't use it in my Color class because one of its properties is an enum, which is not objective-c compliant. I found some workarounds, but they were too much hassle for my taste, so I simply used a notification system.

On the other hand, AppKit is really powerful. And the way document-based apps were implemented save you a lot of time. Many features already come from the get-go. Really cool!

That's all for now, bye :D