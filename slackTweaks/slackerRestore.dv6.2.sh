-#!/bin/bash
-## settingsRestoration
-
-cp /home/ry/Dropbox/linuxTweaks/slackTweaks/51-synaptics.conf /etc/X11/xorg.conf.d/51-synaptics.conf
-
-ln -s /home/ry/Dropbox/subl/64/Sublime\ Text\ 2/sublime_text /sbin/subl
-
-
-su ry
-
-cp ~/Dropbox/linuxTweaks/slackTweaks/slackDrive/.bashrc ~/.bashrc
-cp ~/Dropbox/linuxTweaks/slackTweaks/slackDrive/.asoundrc ~/.asoundrc
-
-ln -s ~/Dropbox/subl/64/Sublime\ Text\ 2/sublime_text /usr/bin/subl