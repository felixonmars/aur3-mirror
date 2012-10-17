# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=linuz-calculator
pkgver=0.3
pkgrel=1
pkgdesc="Linuz calculator with recolorable display and digital font."
arch=(any)
url="http://mickyz.deviantart.com/art/Linuz-Calculator-332253010"
license=('GPL3')
depends=('python2' 'pygtk')

source=(https://dl.dropbox.com/u/58286032/aur/${pkgname}_${pkgver}.tar.gz)
md5sums=('c2f61c46e82b49f0f19e651b01b10a8f')
build() {
	cd "${srcdir}/${pkgname}_${pkgver}"
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/linuz/calc/
	mkdir -p ${pkgdir}/usr/share/locale
	mkdir -p ${pkgdir}/usr/share/fonts/truetype

	install -m 755 -v bin ${pkgdir}/usr/bin/lmc2
	install -m 644 -v desktop ${pkgdir}/usr/share/applications/lmc2.desktop
	install -m 755 -d  ${pkgdir}/usr/share/linuz/calc/
	install -m 755 -v lmc2  ${pkgdir}/usr/share/linuz/calc/
	install -m 755 -v src/gtkrc  ${pkgdir}/usr/share/linuz/calc/
	install -m 755 -v src/*.png  ${pkgdir}/usr/share/linuz/calc/
	install -m 755 -v src/*.xml  ${pkgdir}/usr/share/linuz/calc/
	install -m 755 -v src/*.ttf ${pkgdir}/usr/share/fonts/truetype

	sed -i "s/python/python2/g" $pkgdir/usr/bin/lmc2
	sed -i "s/python/python2/g" $pkgdir/usr/share/applications/lmc2.desktop
}
