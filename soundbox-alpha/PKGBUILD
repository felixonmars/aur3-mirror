# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=soundbox-alpha
pkgver=2.0
pkgrel=1
pkgdesc="Minimalistic audio player write in python"
arch=(any)
url="http://lsf-da-group.deviantart.com/gallery/36432973#/d5ecufa"
license=('GPL3')
groups=()
depends=('python2' 'pygtk' 'gstreamer0.10-python' 'python2-xdg')
conflicts=('scdp')
source=(http://dl.dropbox.com/u/58286032/programas/${pkgname}-${pkgver}.tar.gz)
md5sums=('5ee6474db65aa8a17710b80a91380270')
_pkgname=soundbox
build() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/soundbox
	mkdir -p ${pkgdir}/usr/share/pixmaps
	mkdir -p ${pkgdir}/usr/share/locale
	make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 USRDIR="$pkgdir/usr" install
	sed -i "s/python/python2/g" $pkgdir/usr/bin/${_pkgname}
}
