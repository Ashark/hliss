hliss - Hangouts Linux Individual Screen Share
==============================================

Share only individual screen via hangouts.

Currently if you are using several monitors in linux and want to share one of them in Hangouts, you cannot do this. You can only share all screens simultaniously or choose individual window.
This is for Linux only (do not know about Mac). On Windows it works as expected out of the box.


Possible solutions
------------------
1. Fix chrome/chromium browser itself

    There is a [bug report](https://bugs.chromium.org/p/chromium/issues/detail?id=437507) about this problem, but it is marked as WontFix. If somebody could explore and fix it, it'd be perfect.
	
2. Share a specially prepared window

	2.1 Make a window which shows your desktop inside it and share that window

    It is easy to share such window, but it is still very inconvinient to work with:
    - Shared resolution depends on window size, so you would not like to resize/minimize it.
    - But to be able to work with your pc, you are going to move it to another virtual desktop.
    - You will be confused if you are watching at such window or at actual desktop.
    - Mouse cursor will be invisible, so you wanna use extramaus.

	I tried to implement it, but stopped it. If you are interested, get look at vlc-hangouts script.

    2.2. Make a programm in qt, implementing transparent window titled like "Share me" and passing through mouse clicks and keyboard typing.

    I did not even started developing this. You can contribute.

3. Use hardware hdmi-to-usb grabber and share as a usual webcam

    It is expensive and still inconvinient solution. You cannot easily choose which screen to share.

4. Use fake webcam created with ffmpeg or some wrapper over it

    This is the most convinient solution I have found for now. You just grab needed screen with ffmpeg and switch camera in hangouts to show from. But there are still some problems:
    - Chromium will not add virtual webcam to the list of availible webcams automatically.
    It will only happen when chromium will be completely restarted (i.e. all browser windows should be closed, not only hangouts window) or only after usb webcam was removed/inserted.
    
        So I thought about several workaround of this:
        - Patch chromium to automatically update that list even if it is virtual webcam.
        - Just insert or remove any other usb webcam to your pc after creating virtual webcam. I have checked this, it works.
        - Simulate such action programmatically. I have found something about usb gadget, but did not checked it yet.
        - Unload uvcvideo driver then modprobe it again. Did not checked it yet.
        - Programmatically disable/enable internal laptop webcam. Then chromium will show virtual webcam in its list of available cameras. I used this method successfully. It is in reinsert-internal-webcam script.

How to use
----------
Edit PID and VID variables in fakecamera script according to your internal laptop webcam pid and vid (use lsusb).<br>
Start fakecamera script or activate virtual camera in webcamoid.<br>
Run reinsert-internal-webcam script.<br>
Then choose myFakeCam in the list of cameras in Hangouts window.<br>
Enjoy. You even do not need to restart chromium.<br>

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
