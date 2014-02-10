# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=canna
pkgver=3.7p3
pkgrel=1
pkgdesc='A Japanese input system'
arch=('i686' 'x86_64')
url="http://canna.sourceforge.jp/"
license=('custom')
depends=('glibc')
makedepends=('imake')
source=("http://iij.dl.sourceforge.jp/canna/9565/Canna${pkgver//./}.tar.bz2")

prepare() {
	cd "${srcdir}/Canna${pkgver//./}"
	xmkmf -a
}

build() {
	cd "${srcdir}/Canna${pkgver//./}"
	make cannaPrefix=/usr cannaSrvDir=/usr/bin cannaOwner=root cannaGroup=root
}

package() {
	cd "${srcdir}/Canna${pkgver//./}"
	make cannaPrefix=/usr cannaSrvDir=/usr/bin cannaOwner=root cannaGroup=root DESTDIR="$pkgdir" install
	install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}

md5sums=('0b8c241f63ab4cd3c0b9be569456dc33')
