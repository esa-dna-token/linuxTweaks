#!/bin/sh
##install without kde & xfce groups

##network name: slackware.darks.tar

###edit lilo.conf
##add 'lba32'
##add 'compact'
##shorten timeout
##run lilo

##vi /etc/profile.d/lang.sh to switch default encoding to utf-8

##adduser, append wheel group and activate it under visudo

#download sbopkg & slackpkg+
#set up slackpkg & slackpkg+

#slackpkg install msb
#slackpkg install chromium
#slackpkg install wicd
##clear out all network manager garbage
#slackpkg remove NetworkManager
make sure to chmod all the right stuff in /etc/rc.d

##set up .bashrc for root and normal

wget http://sbopkg.googlecode.com/files/sbopkg-0.37.0-noarch-1_cng.tgz
wget http://sourceforge.net/projects/slackpkgplus/files/slackpkg%2B-1.3.0-noarch-2mt.txz

curl https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/gitNumixAndVim.sh | bash
curl https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/mateSetup.sh | bash

