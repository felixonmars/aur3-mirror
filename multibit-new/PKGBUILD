pkgname=multibit-new
pkgver=0.5.13
pkgrel=1
pkgdesc="A lightweight Bitcoin desktop client powered by the BitCoinJ library."
arch=(any)
license=('GPL')
url="https://multibit.org/"
depends=('java-runtime')
noextract=('multibit-exe.jar')
source=("https://multibit.org/releases/multibit-${pkgver}/multibit-exe.jar"
		multibit multibit.desktop multibit.png)
md5sums=('3b7cdbcdd001064dc6f9f0c0862bb1a3'
         '6d4e589627327c858ab0a1d751bd6124'
         '0f4558787aca475931a8b26653641f5f'
         '41b492c2898448f0199129fcb1178aac')

package() {
	cd "$srcdir" || return 1

	install -D -m755 "${srcdir}/multibit"         "${pkgdir}/usr/bin/multibit"
	install -D -m644 "${srcdir}/multibit-exe.jar"     "${pkgdir}/usr/share/multibit/multibit-exe.jar"

	# Desktop launcher with icon
	install -D -m644 "${srcdir}/multibit.desktop" "${pkgdir}/usr/share/applications/multibit.desktop"
	install -D -m644 "${srcdir}/multibit.png"     "${pkgdir}/usr/share/pixmaps/multibit.png"
}
