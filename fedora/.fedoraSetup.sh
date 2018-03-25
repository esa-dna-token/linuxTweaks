#!/bin/sh
# Run as a normal user:
# wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/fedora/.fedoraSetup.sh -P ~/; sh ~/.fedoraSetup.sh

# Grab the RPM Fusion free repo, because it has awesome stuff.
if [ "`which dnf`" ]; then
    sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    PKGDUDE="dnf"
else
    sudo yum -y localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
    PKGDUDE="yum"
fi

# Always good to start with an upgrade.
sudo ${PKGDUDE} -y upgrade

# Pretty sure some are included, but it can't hurt.
ESSENTIALPKGS="\
    audacity-freeworld clang curl ddccontrol emacs exfat-utils exiv2 firefox \
    fuse-exfat gcc gcc-c++ gifsicle git jpegoptim kernel-headers \
    kernel-devel libsndfile-devel libXrandr-devel make optipng \
    pngquant thunderbird scite SDL-devel vim wget zlib-devel \
"

sudo ${PKGDUDE} -y install $ESSENTIALPKGS

# Sets up some nice Gnome defaults.
if [ `which gnome-shell` ]; then
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gnome3Setup -P ~/; bash ~/.gnome3Setup
fi

# Configure KDE if present:
if [ `which startkde` ]; then
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.kdeSetup.sh -P ~/; bash ~/.kdeSetup.sh
fi

# Mate!
if [ `which mate-panel` ]; then
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.mateSetup.sh -P ~/; bash ~/.mateSetup.sh
fi

# Keybase!
if [ -z "`which run_keybase`" ]; then
    sudo ${PKGDUDE} -y install https://prerelease.keybase.io/keybase_amd64.rpm
    run_keybase
fi

# Sets up: Git, Vim, Emacs, SSH and some nice environment goodies.
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/
sh ~/.genericLinuxConfig.sh

cd
if [ ! -d ~/.iris/ ]; then
    git clone https://github.com/danielng01/iris-floss.git .iris
    cd ~/.iris/
    make
    sudo ln -sf ~/.iris/iris-floss /usr/local/bin/
fi
cd

cd
if [ ! -d ~/.iris-wayland/ ]; then
    git clone https://github.com/danielng01/iris-floss-wayland.git .iris-wayland
    cd ~/.iris-wayland/
    make
    sudo ln -sf ~/.iris-wayland/iris-floss-wayland /usr/local/bin/
fi
cd

# Add 'Chromebook' keyboard layout.
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.add_chromebook_keyboard_layout.sh -P ~/
sudo bash ~/.add_chromebook_keyboard_layout.sh

# Fix headphone audio:
#sudo wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/alsa-base.conf -P /etc/modprobe.d/

# SciTE configuration:
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.SciTEUser.properties -P ~/

# Imgult:
wget -N https://raw.githubusercontent.com/ryanpcmcquen/image-ultimator/master/imgult; sudo install -m755 imgult /usr/local/bin/; rm imgult

echo
echo "    .--. "
echo "   |o_o | "
echo "   |:_/ | "
echo "  //   \ \ "
echo " (|     | ) "
echo "/'\_   _/'\ "
echo "\___)=(___/ "
echo
echo "A reboot may be necessary."
echo
