# Maintainer: mhd <414dbox at GMail>

pkgname=grabtor
pkgver=0.2.0.0
pkgrel=1
pkgdesc="A graphic battery status monitor adapted for xmobar"
arch=('any')
url="https://github.com/414d/grabtor"
license=('GPL3')
makedepends=('ghc')
options=('strip')
install=
source=('git://github.com/414d/grabtor')
md5sums=('SKIP')

build() {
	cd "$srcdir/grabtor"
	runhaskell Setup configure --prefix=/usr --docdir=/usr/share/licenses/$pkgname
	runhaskell Setup build
}


package() {
	cd "$srcdir/grabtor"
	runhaskell Setup copy --destdir=${pkgdir}
	install -D -m644 ./Samples/xmobar.config ${pkgdir}/usr/share/doc/$pkgname/samples/xmobar.config
}
