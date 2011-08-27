# Contributor:  Samed Beyribey <ras0ir at eventualis dot org>
pkgname=piksemel
pkgver=1.3.1
pkgrel=1
pkgdesc="Python binding for iksemel"
arch=('any')
url="http://www.pardus.org.tr"
license=('GPL2')
depends=('python')
makedepends=('python')
source=(http://cekirdek.pardus.org.tr/~bahadir/piksemel/piksemel-$pkgver.tar.gz)
md5sums=(6a1bbb575cea072ca3752521efcaf1bc)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root=$pkgdir  
  install -Dm644 README $pkgdir/usr/share/doc/piksemel/README
}

# vim:set ts=2 sw=2 et:
