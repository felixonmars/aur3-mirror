# Maintaine: Dennis Fink <the_metalgamer@hackerspace.lu>

pkgname='python2-clevercss'
pkgver=0.1
pkgrel=1
pkgdesc="A small markup language for CSS inspired by Python"
arch=(any)
url="http://sandbox.pocoo.org/clevercss/"
license=('GPL')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/C/CleverCSS/CleverCSS-$pkgver.tar.gz"
    "setup.py.diff"
    "clevercss.py.diff")
md5sums=('7f425cccb6bca7c6603cddb652545e26'
         '6af39f65731279803af8ec802852851a'
         '019cd4f70b2e6fba685e3d8436bddc55')
build() {
  cd $srcdir/CleverCSS-$pkgver
  patch -p0 <$srcdir/setup.py.diff
  patch -p0 <$srcdir/clevercss.py.diff
  python2 setup.py build
}

package() {
  cd $srcdir/CleverCSS-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  cd $pkgdir/usr/bin
  mv clevercss.py clevercss.py-python2
}
