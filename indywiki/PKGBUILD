# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=indywiki
pkgver=0.9.9.1
pkgrel=3
pkgdesc="An application for visually browsing Wikipedia."
arch=('i686')
url="http://indywiki.sourceforge.net/"
license=('GPL')
depends=('python' 'pyqt')
source=(http://downloads.sourceforge.net/indywiki/indywiki-${pkgver}.tar.gz 
	indywiki.desktop wikipedia.png)
md5sums=('032eab73fe491b43ca8374733820e1bd' '610e676062452c2c670ef14c6b265bcb' 
	 'f70b46320ee2dd605d8276b56d079ad7')

build() {
	/bin/true
}

package() {
	cd ${srcdir}/indywiki-0991/src/indywiki

	mkdir -p ${pkgdir}/usr/{bin,share/indywiki}
	cp -R * ${pkgdir}/usr/share/indywiki
	cp ${srcdir}/wikipedia.png ${pkgdir}/usr/share/indywiki
	echo -e "#!/bin/bash\n\n/usr/share/indywiki/indywiki.py" \
		>${pkgdir}/usr/bin/indywiki
	chmod 755 ${pkgdir}/usr/bin/indywiki
	install -Dm644 ${srcdir}/indywiki.desktop 
		${pkgdir}/usr/share/applications/indywiki.desktop
}
