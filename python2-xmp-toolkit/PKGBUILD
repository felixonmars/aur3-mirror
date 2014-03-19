# Maintainer: Kwrazi <kwrazi@gmail.com>
_pkgname=xmp-toolkit
_pyname=python-${_pkgname}

pkgname=python2-${_pkgname}
pkgver=2.0.1
pkgrel=1
pkgdesc="Python XMP Toolkit is a library for working with XMP metadata"
arch=('any')
url="https://code.google.com/p/python-xmp-toolkit/"
license=('BSD') # BSD New
#depends=('python2')
makedepends=('python2')
provides=('python2-libxmp')
conflicts=()
replaces=()
backup=()
install=
source=('https://pypi.python.org/packages/source/p/python-xmp-toolkit/python-xmp-toolkit-2.0.1.tar.gz')
md5sums=('5836cb9bc252d06517ba262b3fb5a579')

package() {
  cd "$srcdir/python-${_pkgname}-${pkgver}"
  
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/python2-xmp-toolkit"
  cp LICENSE "$pkgdir/usr/share/licenses/python2-xmp-toolkit/"
}

# vim:set ts=2 sw=2 et:
