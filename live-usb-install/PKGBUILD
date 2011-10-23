pkgname=live-usb-install
pkgver=2.3.2
pkgrel=1
pkgdesc="LiveUSB Install - Create bootable usb sticks from a wide range of different Linux distributions"
url="http://live.learnfree.eu"
license=('GPL')
arch=('i686')
source=('http://download.learnfree.eu/lfu-usb/live-usb-install-2.3.2.tar.gz')
md5sums=('bc3819f81254f814b8e31c022870321e')

# Requires python 2.6, python-glade2, syslinux, wget, p7zip-full, unrar, hal or
# udev, parted, optional python-libtorrent (needed for downloading some
# distributions from Internet)

depends=('python2' 'pygtk' 'libglade' 'syslinux' 'wget' 'p7zip' 'unrar' 'udev' 'parted' 'gksu')

build() {
    cd $startdir/src/

    PKG_DIR="../pkg"
    INSTALL_DIR="$PKG_DIR/usr/share"
    REAL_INSTALL_DIR="/usr/share"

	mkdir -p $INSTALL_DIR/pixmaps
    mkdir -p $INSTALL_DIR/$pkgname
    mkdir -p $INSTALL_DIR/applications

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

	echo -e "[Desktop Entry]\nVersion=1.0\nName=LiveUSB Install\nComment=Tool for creating Live USB drives\nCategories=Application;System;\nExec=gksu python2 /usr/share/$pkgname/live-usb-install.py\nTerminal=false\nType=Application\nName[en_US]=LiveUSB Install\nGenericName[en_US]=LiveUSB Install\nComment[en_US]=Tool for creating Live USB drives\nIcon=live-usb-install" > $INSTALL_DIR/applications/live-usb-install.desktop
}
