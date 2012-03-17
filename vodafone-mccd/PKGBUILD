# Mantainer: M0Rf30
pkgname=vodafone-mccd
pkgver=20120317
pkgrel=1
pkgdesc="Vodafone Mobile Connect Card Driver, a GPRS/UMTS/HSDPA(3G) device manager (andrewbird fork)"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2' 'BSD' 'MIT')
url="https://github.com/meh/vodafone-mobile-connect"
depends=('usb_modeswitch' 'python2-pytz' 'python-pysqlite' 'ozerocdoff' 'dbus-python' 'twisted' 'python-pyserial' 'wvdial' 'pyasn1' 'python-notify' 
'gnome-python-extras' 'pygtk' 'pyxml' 'lsb-release' 'python2-libgnome' 'gnome-python-desktop' 'hal')
install=vodafone-mccd.install
_gitroot="git://github.com/andrewbird/vodafone-mobile-connect.git"
_gitname="vodafone-mobile-connect"

build() {
	msg "Connecting to GIT server...."

	
	[ -d $_gitname ] && {
		cd $_gitname
		git pull origin
		cd ..

		msg "Local files have been updated."
	} || {
		git clone $_gitroot
	}

	msg "GIT checkout done or server timeout"

	rm -rf $_gitname-build
	git clone $_gitname $_gitname-build
	cd $_gitname-build/src/$_gitname

	msg "Starting make..."
	python2 setup.py install --root=$pkgdir
        echo "Select your current timezone"
	sleep 2
	mkdir -p $pkgdir/etc
        tzselect > $pkgdir/etc/timezone
}
