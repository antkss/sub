mkdir /working
cd /working

apk add alsa-lib-dev qt6-qtwebengine-dev libusb-dev sndio-dev libunwind-dev sdl12-compat-dev gcc
apk add alsa-lib-dev bison curl-dev flex glib-dev glu-dev iasl kbuild mesa-dev libvncserver-dev libcap-dev libvpx-dev libxcomposite-dev libxinerama-dev libxslt-dev libxcursor-dev libxrandr-dev lvm2-dev libxmu-dev linux-pam-dev opus-dev pulseaudio-dev qt5-qtbase-dev qt5-qtx11extras-dev qt5-qttools-dev sdl12-compat-dev xorg-server-dev yasm python3-dev
wget "https://download.virtualbox.org/virtualbox/7.1.8/VirtualBox-7.1.8.tar.bz2"
tar -xf VirtualBox-7.1.8.tar.bz2
cd VirtualBox-7.1.8
./configure
make -j$(nproc)
