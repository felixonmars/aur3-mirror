# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=python16-pyserial
pkgver=1.21
pkgrel=1
pkgdesc="Multiplatform Serial Port Module for Python"
arch=('any')
url="http://pyserial.sf.net"
license=('custom:PYTHON')
depends=(python16 dos2unix)
source=(http://downloads.sourceforge.net/project/pyserial/pyserial/$pkgver/pyserial-$pkgver.zip
        pyserial-py16.patch)

build() {
  cd $srcdir/pyserial-$pkgver
  # Fix up breakage (why does this even happen?)
  dos2unix serial/*.py
  patch -p1 < $srcdir/pyserial-py16.patch
}

package() {
  cd $srcdir/pyserial-$pkgver
  python1.6 setup.py install --root=$pkgdir
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
md5sums=('880a69d8c5dd60794e9346db46b4a8e8'
         '89186f4f9683d3dd7620d91b46437b71')
