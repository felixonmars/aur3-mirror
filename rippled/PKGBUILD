# Maintainer: Roberto Catini <roberto.catini@gmail.com> 

pkgname=rippled
pkgrel=2
GIT_TAG=0.27.3-sp2
pkgver=${GIT_TAG//-/.}
pkgdesc="Ripple peer-to-peer network daemon"
arch=('i686' 'x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/${pkgname}/rippled.cfg")
depends=('protobuf' 'openssl' 'boost-libs')
makedepends=('git' 'scons' 'boost')
checkdepends=('nodejs')
source=("git://github.com/ripple/rippled.git#tag=${GIT_TAG}")
sha512sums=('SKIP')


build() {
	cd "$srcdir/$pkgname"
	scons build/rippled
}

check() {
	cd "$srcdir/$pkgname"
	npm install
	npm test
	build/rippled --unittest
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D build/rippled "${pkgdir}/usr/bin/rippled"
	install -D -m644 doc/rippled-example.cfg "${pkgdir}/etc/${pkgname}/rippled.cfg"
}
