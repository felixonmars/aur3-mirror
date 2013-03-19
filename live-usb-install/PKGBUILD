pkgname=live-usb-install
pkgver=2.3.10
pkgrel=2
pkgdesc="LiveUSB Install - Create bootable usb sticks from a wide range of different Linux distributions"
url="http://live.learnfree.eu"
license=('GPL')
arch=('i686' 'x86_64')
source=('http://download.learnfree.eu/lfu-usb/live-usb-install-2.3.10.tar.gz')
md5sums=('845c2975382e01885a7e8876d17a74cd')

# Requires python 2.6, python-glade2, syslinux, wget, p7zip-full, unrar, hal or
# udev, parted, optional python-libtorrent (needed for downloading some
# distributions from Internet)

depends=('python2' 'pygtk' 'libglade' 'syslinux' 'wget' 'p7zip' 'mtools' 'unrar' 'udev' 'parted' 'gksu' 'python2-dbus')

build() {
    cd $srcdir

    PKG_DIR="../pkg"
    INSTALL_DIR="$PKG_DIR/usr/share"
    REAL_INSTALL_DIR="/usr/share"

	mkdir -p $INSTALL_DIR/pixmaps
    mkdir -p $INSTALL_DIR/$pkgname
    mkdir -p $INSTALL_DIR/applications

	# quick hack to replace python with python2, TODO: make a patch for arch
	sed -i 's!#\!/usr/bin/env python!#\!/usr/bin/env python2!g' live-usb-install.py

    cp -r asubprocess.py\
	   	  live-usb-install.py\
	   	  backg.png\
	   	  syslinux-custom.cfg\
	   	  grub.exe\
	   	  syslinux.mbr\
	   	  menu.lst\
	   	  syslinux-wingrub.cfg\
	   	  live-usb-install.glade\
	   	  vesamenu.c32\
		  logo.png\
		  presets\
		  pyudev\
		  locale\
		  $INSTALL_DIR/$pkgname

	cp logo.png $INSTALL_DIR/pixmaps/live-usb-install.png

	# create desktop entry
	echo -e "[Desktop Entry]\nVersion=1.0\nName=LiveUSB Install\nComment=Tool for creating Live USB drives\nCategories=Application;System;\nExec=gksu python2 /usr/share/$pkgname/live-usb-install.py\nTerminal=false\nType=Application\nName[en_US]=LiveUSB Install\nGenericName[en_US]=LiveUSB Install\nComment[en_US]=Tool for creating Live USB drives\nIcon=live-usb-install" > $INSTALL_DIR/applications/live-usb-install.desktop
}
