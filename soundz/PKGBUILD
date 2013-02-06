# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=soundz
pkgver=3.7
pkgrel=1
pkgdesc="Minimalistic audio player write in python"
arch=(any)
url="http://mickyz.deviantart.com/art/Soundz-3-1-336613427"
license=('GPL3')
groups=()
depends=('python2' 'pygtk' 'gstreamer0.10-python' 'python2-xdg' 'gstreamer0.10-fluendo' 'mutagen')

source=(http://dl.dropbox.com/u/58286032/aur/${pkgname}-${pkgver}.tar.gz)
md5sums=('2e1028e38a9f651f3bc1f0615838ed08')
build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/soundz/
	mkdir -p ${pkgdir}/usr/share/pixmaps
	mkdir -p ${pkgdir}/usr/share/locale
	mkdir -p ${pkgdir}/etc/xdg/autostart

	make BINDIR=${pkgdir}/usr/bin \
	APPDIR=${pkgdir}/usr/share/applications \
	FONDIR=${pkgdir}/usr/share/fonts/truetype \
	INSDIR=${pkgdir}/usr/share/soundz \
	XDGDIR=${pkgdir}/etc/xdg/autostart \
	LOCDIR=${pkgdir}/usr/share/locale \
	ICODIR=${pkgdir}/usr/share/pixmaps \
	GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 USRDIR="$pkgdir/usr" install
	sed -i "s/python/python2/g" $pkgdir/usr/share/${pkgname}/${pkgname}
}
