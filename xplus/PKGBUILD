# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=xplus
pkgver=0.3
pkgrel=1
pkgdesc="Minimalistic calculator write in python"
arch=(any)
url="http://mickyz.deviantart.com/art/Linuz-XXX-stuff-353792010"
license=('GPL3')
conflicts=('linuz-calculator', 'bit-calculator')
depends=('python2' 'pygtk')

source=(http://dl.dropbox.com/u/58286032/aur/${pkgname}-${pkgver}.tar.gz)
md5sums=('bdb3d662683a38f5fa360b4ecef49c83')
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/linuz/

	install -m 755 -v binxplus ${pkgdir}/usr/bin/xplus
	install -m 644 -v xplus.d ${pkgdir}/usr/share/applications/xplus.desktop
	install -m 644 -v *.ttf *.xml *.png gtkrc ${pkgdir}/usr/share/linuz/
	install -m 755 -v xplus ${pkgdir}/usr/share/linuz/
	sed -i "s/python/python2/g" $pkgdir/usr/share/linuz/${pkgname}
}
