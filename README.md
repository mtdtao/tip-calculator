# Pre-work - *tip-calculator*

**tip-calculator** is a tip calculator application for iOS.

Submitted by: **Jintao Zeng**

Time spent: **4** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Sending data through setting view and tip view (when default tip percentage was selected with done button, tips view will change its percentage to default when push back)

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/zasWnkO.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
- Problems with UIAnimation when I want to change the position of the view. After setting a new position for the view, it will shows an animation to the right position but it will go back.
- After entering a long number in bill field, the text style will change to normal (which I have set the text style as Ultra Light at first)

## License

    Copyright [2015] [Jintao Zeng]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
