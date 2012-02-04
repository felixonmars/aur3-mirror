# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

pkgname=liten
pkgver=0.1.5
pkgrel=4
pkgdesc='A deduplication command line tool and library'
arch=('any')
url='http://code.google.com/p/liten/'
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=(http://liten.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('f7578f6cd3b70a58379622ec45a703d3')

build() {
  true
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr || return 1
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -m644 {CHANGELOG,README,TODO}.txt $pkgdir/usr/share/doc/$pkgname
  install -m644 docs/liten_documentation.html $pkgdir/usr/share/doc/$pkgname
}

# vim:ts=2:sw=2:et:
