# Maintainer: Toobkrow

pkgname=mountie
pkgver=20120809
pkgrel=1
pkgdesc="tool for quickly mounting and unmounting devices"
arch=('any')
url="https://github.com/Toobkrow/mountie"
license=('GPL3')
depends=('python-dbus>=1.0' 'python' 'udisks')
makedepends=('git')
optdepends=('ranger: open device immediately after mounting')

_gitroot="https://github.com/Toobkrow/mountie.git"
_gitname="master"

build() {
	cd $srcdir

	if [ -d $srcdir/$pkgname ] ; then
		msg "update git"
		cd $pkgname && git pull origin
	else
		msg "clone git"
		git clone $_gitroot
	fi
}

package() {
	mkdir -p $pkgdir/usr/lib/python3.2/site-packages
	cp -r $srcdir/$pkgname $pkgdir/usr/lib/python3.2/site-packages
	mkdir -p $pkgdir/usr/bin
	echo "#!/bin/bash
	python /usr/lib/python3.2/site-packages/$pkgname/mountie.py" > $pkgdir/usr/bin/mountie
	chmod +x $pkgdir/usr/bin/mountie
}
