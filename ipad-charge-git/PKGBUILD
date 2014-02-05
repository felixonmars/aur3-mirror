# Maintainer:  danyf90 <daniele.formichelli@gmail.com>

pkgname=ipad-charge-git
_pkgname=ipad_charge.git
pkgver=20131118
pkgrel=1
pkgdesc="USB charging control utility used to enable/disable charging of an Apple device connected to USB port."
arch=('any')
license=('GPL')
depends=('libusbx')
makedepends=('make' 'git')
url="https://github.com/mkorenkov/ipad_charge"

 _gitroot=git://github.com/mkorenkov/$_pkgname
 _gitname=$_pkgname

build() {
	cd $srcdir

	msg "Connecting to GIT server...."
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname --depth=1
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	rm -rf $srcdir/$_gitname-build
	cp -R $srcdir/$_gitname $srcdir/$_gitname-build

	cd $srcdir/$_pkgname-build

	make
}

package() {
	cd $srcdir/$_pkgname-build

	install -Dm755 ipad_charge $pkgdir/usr/bin/ipad_charge
	install -Dm644 95-ipad_charge.rules $pkgdir/etc/udev/rules.d/95-ipad_charge.rules
}
