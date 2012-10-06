# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=pix-image-viewer
pkgver=2.4
pkgrel=1
pkgdesc="A simple image viewer and a screenshoot tool in developing"
arch=(any)
url="http://mickyz.deviantart.com/art/Pix-Image-Viewer-329178796"
license=('GPL3')
depends=('python2' 'pygtk' 'python-imaging' 'python2-xdg' 'pywebkitgtk')

source=(https://dl.dropbox.com/u/58286032/aur/${pkgname}_${pkgver}.tar.gz)
md5sums=('4c8c3b9301420f5b47338e6c77d1225b')
build() {
	cd "${srcdir}/${pkgname}_${pkgver}"
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/pix2
	mkdir -p ${pkgdir}/usr/share/locale
	make BINDIR=${pkgdir}/usr/bin \
	APPDIR=${pkgdir}/usr/share/applications \
	LOCDIR=${pkgdir}/usr/share/locale \
	INSDIR=${pkgdir}/usr/share/pix2 install 
	sed -i "s/python/python2/g" $pkgdir/usr/bin/pix2
}
