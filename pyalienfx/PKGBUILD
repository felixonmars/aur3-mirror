# Package Maintainer: Alejandro Hernandez -> aehs29@ieee.org
# Original code by: ledjfou125@gmail.com
# Contributions: abarry-pyalienfx

pkgname=pyalienfx
realname=pyAlienFX
pkgver=v1.0.2
pkgrel=3
pkgdesc="Multiplataform software to control Alienware LED's written in Python2"
arch=('any')
url="http://code.google.com/p/pyalienfx/"
license="GPLv3"
depends=(python2 pygtk gksu libusb)

source=("https://abarry-pyalienfx.googlecode.com/archive/206a0334b807011d56f8b11d9767b63f758befe5.tar.gz")
md5sums=('SKIP')

package() {
	#Create necessary directories
	mkdir -p $pkgdir/opt
	mkdir -p $pkgdir/usr/bin

	# Copy necessary files
	cd ${srcdir}
	cp abarry-pyalienfx-206a0334b807 -R $pkgdir/opt/pyAlienFX

	# Generate the bin command
	cd ${pkgdir}/usr/bin
	echo -ne "#!/bin/bash\ncd /opt/pyAlienFX\ngksu python2 /opt/pyAlienFX/pyAlienFX.py" > pyalienfx
	chmod +x pyalienfx
}
