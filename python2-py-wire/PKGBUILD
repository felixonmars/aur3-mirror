pkgname=python2-py-wire
pkgver=0.4
pkgrel=1
pkgdesc="Module for interacting with a Wired server"
arch=(any)
url="http://sourceforge.net/projects/pywire"
license=("MIT")
source=("http://downloads.sourceforge.net/pywire/py-wire-$pkgver.tar.gz")
depends=(python2-tlslite python2-distribute)
conflicts=(py-wire)
provides=(py-wire)
replaces=(py-wire)
makedepends=(python2)
optdepends=("python2-wipy: GUI client module")
md5sums=('e9528284b6f7dc59538e50648e85f63d')

build() {
  cd "$srcdir/py-wire-$pkgver"
  python2 setup.py install \
    --prefix=$pkgdir/usr
}

package() {
  install -Dm644 "$srcdir/py-wire-$pkgver/README" "$pkgdir/usr/share/licenses/$pkgname/README"
}
