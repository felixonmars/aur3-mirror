pkgname=py-wired
pkgver=0.1
pkgrel=1
pkgdesc="Server that implements the Wired protocol, written in Python."
arch=(any)
url="http://sourceforge.net/projects/pywire"
license="MIT"
source=("http://downloads.sourceforge.net/pywire/py-wired-$pkgver.tar.gz")
depends=(python2-distribute)
makedepends=(python2)
md5sums=('d9070930616fe0a346a7af24bde8ba0d')

package() {
  cd "$srcdir/py-wired-$pkgver"
  python2 setup.py install --prefix=$pkgdir/usr
}
