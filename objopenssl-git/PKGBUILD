# Maintainer: Florian Zeitz <florob at babelmonkeys dot de>

pkgname=objopenssl-git
pkgver=20130402
pkgrel=1
pkgdesc="OpenSSL bindings for ObjFW."
arch=('i686' 'x86_64')
url="https://webkeks.org/git"
license=('BSD')
depends=('objfw-git' 'openssl')
makedepends=('git' 'clang')

source=('git+https://webkeks.org/git/objopenssl.git')
md5sums=('SKIP')
_gitname=objopenssl

pkgver () {
  date +"%Y%m%d"
}
 
build() {
	cd "$srcdir/$_gitname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
