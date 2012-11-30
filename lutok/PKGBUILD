# Maintainer: Dhananjay Balan <kindle.dhananjay AT gmail COM>

pkgname=lutok
pkgver=0.2
pkgrel=1

depends=('lua' 'pkg-config')
pkgdesc="Lightweight C++ API for Lua"
url="http://http://code.google.com/p/lutok/"
arch=('i386', 'x86_64')
license=('custom')
source=(http://lutok.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('d327de3a634b90af33eb631a8eafa24d')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr 
	make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
  make DESTDIR=${pkgdir} installcheck || return 1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	
}
