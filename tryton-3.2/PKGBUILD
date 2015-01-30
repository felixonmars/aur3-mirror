# Maintainer: Adrian Stern <adrian.stern@unchained.ch>
# Contributor: Oliver Guenthardt <oliver.guenthardt@unchained.ch>
pkgname=tryton-3.2
pkgnameurl=tryton
pkgver=3.2.0
_pkgdir=3.2
pkgrel=1
pkgdesc="A three-tiers high-level general purpose application platform (client application)"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python2>=2.7' 'gtk2' 'pygtk>=2.0' 'librsvg' 'python2-dateutil')
optdepends=('python2-pytz: timezone support')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$pkgnameurl-$pkgver.tar.gz"
        'tryton-3.2.desktop')
md5sums=('dae7f87e2461f503075124c3dc877cdd'
         '7ca15ad6c790c78817fe1a1b6a2c3fcf')

build() {
  cd $srcdir/$pkgnameurl-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgnameurl-$pkgver
  python2 setup.py install --root=$pkgdir
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
