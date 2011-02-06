# Contributor: Kevin Whitaker <eyecreate@gmail dot com>
pkgname=improviser
pkgver=0.8.6.3
pkgrel=1
pkgdesc="Automatic music generation software. Experiments in musical content generation."
arch=("i686" "x86_64")
url="http://improviser.onderstekop.nl/"
license=("GPL")
depends=("mingus" "python")
makedepends=()
source=("http://pypi.python.org/packages/source/i/improviser/improviser-$pkgver.tar.gz")
md5sums=('8cbeccc96bba17c9cd05f094d32106f6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
  install -d "$pkgdir/usr/share/doc/$pkgname"
}
 
