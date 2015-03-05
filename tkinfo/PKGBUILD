# Maintainer: Hedede <haddayn@gmail.com>

pkgname=tkinfo
pkgver=2.8
pkgrel=4
arch=('i686' 'x86_64')
license=('BSD')
pkgdesc="Browser for GNU Texinfo files"
url="http://math-www.uni-paderborn.de/~axel/tkinfo/"
depends=('tk')
source=('http://math-www.uni-paderborn.de/~axel/tkinfo/tkinfo-2.8.tar.gz')
md5sums=('ba798b5e38409b9461bd225646dfe651')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m755 tkinfo       "${pkgdir}/usr/bin/tkinfo"
	install -D -m644 tkinfo       "${pkgdir}/usr/share/man/man1/tkinfo"
	install -D -m644 TkInfo.xpm   "${pkgdir}/pkg/usr/share/pixmaps/TkInfo.xpm"
}
