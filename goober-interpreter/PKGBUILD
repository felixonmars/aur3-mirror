# Maintainer: Austin Adams <screamingmoron AT gmail DOT com>
pkgname="goober-interpreter"
pkgver=0.4
pkgrel=1
pkgdesc="A useless language written in Python"
arch=("any")
url="http://code.google.com/p/goober"
license=("GPL")
depends=("python2")
makedepends=("mercurial")
_hgrevision="00a0e0abf8f3"

build() {
	cd "$srcdir/"

	hg clone http://goober.googlecode.com/hg/ "$pkgname-$pkgver" -r $_hgrevision
	
	cd "$pkgname-$pkgver/"
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  make DESTDIR="$pkgdir/" install
}
