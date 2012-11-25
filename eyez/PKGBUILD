# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=eyez
pkgver=1.0b
pkgrel=1
pkgdesc="A slight media viewer for images, audio and video, written for XFCE."
arch=(any)
url="http://mickyz.deviantart.com/art/Eyez-1-0b-332701601"
license=('GPL3')
groups=()
depends=('python2' 'pygtk' 'python-imaging' 'gstreamer0.10-python' 'python2-xdg' 'gstreamer0.10-fluendo' 'libvisual' 'pywebkitgtk')

source=(http://dl.dropbox.com/u/58286032/aur/${pkgname}-${pkgver}.tar.gz)
md5sums=('d91f1e55991aa4ffde7267a75b72d8c4')
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/eyez
	mkdir -p ${pkgdir}/usr/share/pixmaps
	mkdir -p ${pkgdir}/usr/share/locale
	make BINDIR=${pkgdir}/usr/bin \
	APPDIR=${pkgdir}/usr/share/applications \
	INSDIR=${pkgdir}/usr/share/eyez \
	LOCDIR=${pkgdir}/usr/share/locale \
	GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 USRDIR="$pkgdir/usr" install
	sed -i "s/python/python2/g" $pkgdir/usr/share/${pkgname}/${pkgname}
}
