# Maintainer: perlawk
pkgname=python2-freeimagepy
_pkgname=FreeImagePy
pkgver=2.0.1
pkgrel=1
pkgdesc="This library wrap the FreeImage library functions so a python developer can easy drive FreeImage .dll/.so."
arch=(any)
url="http://freeimagepy.sourceforge.net/"
license=('GPL')
conflicts=()
provides=()
depends=('python2')
source=(http://heanet.dl.sourceforge.net/project/freeimagepy/FreeImagePy/V$pkgver/${_pkgname}_wo_dll-$pkgver.tar.bz2)
md5sums=('2a52777400d585e565a23e7124b647d3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
#FreeImagePy_wo_dll-2.0.1.tar.bz2
