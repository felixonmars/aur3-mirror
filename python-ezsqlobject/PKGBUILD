# Maintainer: TDY <tdy@gmx.com>

pkgname=python-ezsqlobject
pkgver=0.1.1
pkgrel=2
pkgdesc="A wrapper for the SQLObject object-relational mapping package"
arch=('any')
url="http://freenet.mcnabhosting.com/python/ezsqlobject/"
license=('GPL')
depends=('mysql-python' 'python2-sqlobject')
source=(http://freenet.mcnabhosting.com/python/${pkgname/*-}/${pkgname/*-}-$pkgver.tar.gz
        $pkgname-$pkgver.diff)
md5sums=('0e6da6b2b989708ad08cfc7d6cb04311'
         '52cee914ffe2922ae91ca7d01a1909ae')

build() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.diff
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/"
}
