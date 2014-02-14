# Maintainer: Jekyll Wu <adaptee at gmail dot com>
# Contributor: maddien <martinstitz@gmx.de>

pkgname=ksplasherx
pkgver=2.0beta2
pkgrel=4
pkgdesc="A Splash Screen Editor and Creator for KDE4"
arch=(any)
url="http://sourceforge.net/projects/ksplasher"
license="GPL"
depends=('python2-pyqt4' 'python2-pillow')
source=(http://www.kde-look.org/CONTENT/content-files/88975-${pkgname}${pkgver}.tar.gz
		$pkgname-PIL.patch)
sha1sums=('f0fa5935880a20efea8c9cb3b604f78492a10306'
          'b6c5b879932c0a73b562c9a3391a509016d8c95e')

prepare()
{
	# Fix filters.py PIL imports
	patch -d "$pkgname" -Np1 -i "$srcdir/$pkgname-PIL.patch"
}

build()
{
	cd "${srcdir}/${pkgname}"
	# only works with python2
	sed -i 's/python/python2/' ksplasherx
}

package()
{
	mkdir "${pkgdir}/usr"
	mkdir "${pkgdir}/usr/share"
	mkdir "${pkgdir}/usr/share/ksplasherx"
	mkdir "${pkgdir}/usr/share/applications"
	mkdir "${pkgdir}/usr/share/pixmaps"
	mkdir "${pkgdir}/usr/bin/"

	cd "${srcdir}/ksplasherx"
	cp -r * "${pkgdir}/usr/share/ksplasherx"
	rm "${pkgdir}/usr/share/ksplasherx/ksplasherx"
	cp ksplasherx "${pkgdir}/usr/bin/"
	cp ksplasherx.desktop "${pkgdir}/usr/share/applications/"
	cp ksicon.png "${pkgdir}/usr/share/pixmaps/"

	chmod +x "${pkgdir}/usr/bin/ksplasherx"
}
