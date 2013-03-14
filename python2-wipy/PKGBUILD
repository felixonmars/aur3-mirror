pkgname=python2-wipy
pkgver=0.2
pkgrel=2
pkgdesc="GUI Wired client using wxPython"
arch=(any)
url="http://sourceforge.net/projects/pywire"
license=("MIT")
source=("http://downloads.sourceforge.net/pywire/WiPy-$pkgver.tar.gz"
"http://zankasoftware.com/wired/icon.png"
"wipy"
"wipy.desktop")
depends=(python2-py-wire python2-distribute "wxpython>=2.5")
makedepends=(python2)
conflicts=(wipy)
provides=(wipy)
replaces=(wipy)
md5sums=('c1f6299e5a6dd61b21373f3bf48722c6'
         '2c81e02ba58b3019da32e72cafce2beb'
         '10c4d687aeb68e50ba5620aa7da364ab'
         '6539543e40fe7a85cdadb52ddc44e5a8')

build() {
  cd "$srcdir/WiPy-$pkgver"
  python2 setup.py install --prefix=$pkgdir/usr
}

package() {
  cd "$srcdir/WiPy-$pkgver"
  install -Dm755 "$srcdir/wipy" "$pkgdir/usr/bin/wipy"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/wipy.png"
  install -Dm644 "$srcdir/wipy.desktop" "$pkgdir/usr/share/applications/wipy.desktop"
}
