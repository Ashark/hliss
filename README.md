hliss - Hangouts Linux Individual Screen Share
==============================================

Share only individual screen via hangouts.

![Chromium status](https://img.shields.io/badge/chromium%20v67.0.3396.62%20-workaround-green.svg)
![Firefox status](https://img.shields.io/badge/firefox%20v60.0.1-workaround-green.svg)

Currently if you are using several monitors in Linux and want to share one of them in Hangouts, you cannot do this. Scripts in this repository are made to workaround this. This is for Linux only (on Windows and macOS it works as expected out of the box).

Google support [informs](https://support.google.com/hangouts/answer/2944865) that hangouts is working in Chrome, Internet Explorer, Safari and Firefox. So in Linux we have two browsers to choose from: Chromium/Chrome and Firefox.

## This table shows currently available options:

| Browser | Out of the box | fakecamera | special window |
| --- | --- | --- | --- |
| Chromium 67.0.3396.62 | :red_circle: all screens simultaniously | :red_circle: doesn't work | vlc-hangouts works
| Firefox 60.0.1 | :red_circle: all screens simultaniously | works | :red_circle: doesn't work


## Ideas for solutions

1. Fix chrome/chromium and Firefox browser itself

    - Mozilla Firefox bug report about this probem: https://bugzilla.mozilla.org/show_bug.cgi?id=1552456
    
    - Chromium bug report about this problem: https://bugs.chromium.org/p/chromium/issues/detail?id=396091#c34 (already in progress)
	
2. Share a specially prepared window

	2.1 Make a window which shows your desktop inside it and share that window

    It is easy to share such window, but it is still very inconvinient to work with:
    - Shared resolution depends on window size, so you would not like to resize/minimize it.
    - But to be able to work with your pc, you are going to move it to another virtual desktop.
    - You will be confused if you are watching at such window or at actual desktop.
    - Mouse cursor will be invisible, so you wanna use extramaus.

	If you are interested, get look at vlc-hangouts script.

    2.2. Make a programm in qt, implementing transparent window titled like "Share me" and passing through mouse clicks and keyboard typing.

    I did not even started developing this. You can contribute.

3. Use hardware hdmi-to-usb grabber and share as a usual webcam

    It is expensive and still inconvinient solution. You cannot easily choose which screen to share.

4. Use fake webcam created with ffmpeg or some wrapper over it

    This is the most convinient solution I have found for now. You just grab needed screen with ffmpeg and switch camera in hangouts to show from. But there are still some problems:
    - Chromium will not add virtual webcam to the list of availible webcams, see #1.
    

## How to use

### fakecamera workaround
Make sure you have installed ffmpeg and v4l2loopback<br>
Start Firefox browser<br>
Start fakecamera script, enter screen number or activate virtual camera in webcamoid.<br>
Then choose myFakeCam in the list of cameras in Hangouts window.<br>
Enjoy. You even do not need to restart browser.<br>

### vlc-hangouts workaround
Compile [ExtraMaus](http://dodger-tools.sourceforge.net/cms/index.php?id=100000201) and install it as ~/bin/extramaus<br>
Optionally (if using kde) import ShareMe-window.kwinrule in Window Management settings.<br>
Start Chromium browser<br>
Start vlc-hangouts script, enter screen number.<br>
Then go to hangouts video call browser window, go to menu (three dots in the upper right corner), share screen, select "choose window" tab, select window called ShareMe (it is renamed vlc window)<br>
Enjoy.<br>
After you close ShareMe window, extramaus will be stopped automatically.

Tips
----
If you use webcamoid, then you will be able to switch shared screen on the fly.

Related Links
-------------
[Original bug report in 2015](https://bugs.chromium.org/p/chromium/issues/detail?id=437507)<br>
[Another bug report](https://bugs.chromium.org/p/chromium/issues/detail?id=660032)<br>
[Question at unix.se](https://unix.stackexchange.com/questions/152435/sharing-your-desktop-with-google-hangouts-dual-monitor-and-gnome-shell)<br>
[Deactivate webcam info at askubuntu](https://askubuntu.com/questions/189708/how-to-disable-integrated-webcam-and-still-be-able-to-use-an-external-one)<br>
[Redirections with root permissions at ubuntuforums](https://ubuntuforums.org/showthread.php?t=766891)

You can make it better
----------------------
Feel free to contribute.
If you are familar with usb gadget, than maybe you can suggest a better solution.
