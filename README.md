Little Clipper
==============

A proof of concept for an OS X system tray application to quickly send the
contents of your system clipboard to a Little Printer.

For now, simply run the application and it'll send the plain text version of
whatever is on your clipboard directly to the printer. You'll need to configure
the Direct Print Code in `TTAppDelegate.m` (this should be put into
`NSUserDefaults`). There aren't any buttons.

This is an OS X 10.8 application, developed in Xcode 4.6. It uses CocoaPods for
dependency management.
