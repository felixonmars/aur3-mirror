pkgname=wipy
pkgver=0.2
pkgrel=3
pkgdesc="GUI frontend for py-wire"
arch=(any)
url="http://sourceforge.net/projects/pywire"
license="MIT"
source=("http://downloads.sourceforge.net/pywire/WiPy-$pkgver.tar.gz"
"http://zankasoftware.com/wired/icon.png"
"wipy"
"wipy.desktop")
depends=("py-wire>=0.4-2" python2-distribute "wxpython>=2.5")
makedepends=(python2)
md5sums=('c1f6299e5a6dd61b21373f3bf48722c6'
         '2c81e02ba58b3019da32e72cafce2beb'
         '10c4d687aeb68e50ba5620aa7da364ab'
         '189e9fabfab5bbb916d207d90b940ca2')

package() {
  cd "$srcdir/WiPy-$pkgver"
  python2 setup.py install --prefix=$pkgdir/usr
  install -Dm755 "$srcdir/wipy" "$pkgdir/usr/bin/wipy"
  install -Dm644 "$srcdir/wipy.desktop" "$pkgdir/usr/share/applications/wipy.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/wipy.png"
}
