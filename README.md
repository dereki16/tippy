# # Pre-work - *Tippy*

**Tippy** is a tip calculator application for iOS.

Submitted by: **Derek Iniguez**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Settings view controller containing a slider that allows user to implement a custom tip percentage ranging from 10% to 50%.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

GIF created with [recordit](https://recordit.co/hp6IVmuIS9).

## Notes

The settings view controller was easier to set up programatically, I had trouble doing so via the storyboard. The custom tip and total wouldn't update automatically, and the slider would return back to its original value of 15 after going back to settings.

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
