pkgname=e-deklaracje-2013
pkgrel=1
pkgver=5.0.2
pkgdesc="Program to tax settlements in Poland"
arch=('i686' 'x86_64')
url="http://www.finanse.mf.gov.pl/systemy-informatyczne/e-deklaracje"
license=(unknown)
[[ ${CARCH} = 'i686' ]] && depends=('adobe-air' 'acroread' 'acroread-fonts')
[[ ${CARCH} = 'x86_64' ]] && depends=('acroread' 'adobe-air' 'lib32-libxt' 'acroread-fonts')

makedepends=('unzip')
source=('e-deklaracje-2013.air::http://www.finanse.mf.gov.pl/documents/766655/1196444/e-DeklaracjeDesktop.air' 'e-deklaracje-2013.desktop')
noextract=(e-deklaracje-2013.air)
md5sums=('efb9306045898291c807f5c1830479e0'
         'd38f46ee6473fffa7f54f74158f376d6')

package() {
	unzip -q -u e-deklaracje-2013.air

	install -D -m 644 "$srcdir/e-deklaracje-2013.air" "$pkgdir/opt/$pkgname/$pkgname.air"
	install -D -m 644 "$srcdir/assets/icons/icon128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -D -m 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m 755 "/usr/bin/adobe-air" "$pkgdir/opt/$pkgname/adobe-air_$pkgname"
	sed -i 's/-nodebug //' "$pkgdir/opt/$pkgname/adobe-air_$pkgname"
}