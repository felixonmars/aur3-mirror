pkgname=python2-py-wired
pkgver=0.1
pkgrel=1
pkgdesc="Cross platform Wired server"
arch=(any)
url="http://sourceforge.net/projects/pywire"
license=("MIT")
source=("http://downloads.sourceforge.net/pywire/py-wired-$pkgver.tar.gz")
depends=(python2-distribute)
makedepends=(python2)
conflicts=(py-wired)
provides=(py-wired)
replaces=(py-wired)
md5sums=('d9070930616fe0a346a7af24bde8ba0d')

build() {
  cd "$srcdir/py-wired-$pkgver"
  python2 setup.py install \
    --prefix=$pkgdir/usr
}

package() {
  install -Dm644 "$srcdir/py-wired-$pkgver/README" "$pkgdir/usr/share/licenses/$pkgname/README"
}
