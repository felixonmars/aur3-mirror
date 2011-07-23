# Maintainer: Austin Adams <screamingmoron AT gmail DOT com>
pkgname="pybf"
pkgver=0.4
pkgrel=1
pkgdesc="A brainfsck interpreter written in Python"
arch=("any")
url="http://code.google.com/p/pybf"
license=("GPL")
depends=("python2")
makedepends=("mercurial")
_hgrevision="79a84df27523"

build() {
	cd "$srcdir/"

	hg clone http://pybf.googlecode.com/hg/ "$pkgname-$pkgver" -r $_hgrevision
	
	cd "$pkgname-$pkgver/"
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  make DESTDIR="$pkgdir/" install
}
