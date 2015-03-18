# Maintainer: Roberto Catini <roberto.catini@gmail.com> 

pkgname=rippled-git
_gitname=rippled
pkgrel=2
pkgver=0.27.0.r138.gef2a436
pkgdesc="Ripple peer-to-peer network daemon - develop branch"
arch=('i686' 'x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
conflicts=('rippled')
backup=("etc/${pkgname}/rippled.cfg")
depends=('protobuf' 'openssl' 'boost-libs')
makedepends=('git' 'scons' 'boost')
checkdepends=('nodejs')
source=("git://github.com/ripple/rippled.git#branch=develop")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"
	scons build/rippled
}

check() {
	cd "$srcdir/$_gitname"
	npm install
	npm test
	build/rippled --unittest
}

package() {
	cd "$srcdir/$_gitname"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
	install -D build/rippled "${pkgdir}/usr/bin/rippled"
	install -D -m644 doc/rippled-example.cfg "${pkgdir}/etc/${_gitname}/rippled.cfg"
}
