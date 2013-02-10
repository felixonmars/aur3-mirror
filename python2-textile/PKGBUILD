# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu
# Submitter: kang <kang@insecure.ws>

pkgname=python2-textile
pkgver=2.1.5
pkgrel=4
pkgdesc='Textile processing for python'
arch=('any')
url='http://pypi.python.org/pypi/textile'
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/t/textile/textile-$pkgver.tar.gz" 'LICENSE')
md5sums=('6e030e112eca1dafa1be84cf5575560d'
         '0493c01e4ac59f088934e423168e5859')
conflicts=('python2-textile-git')


build() {
  cd "$srcdir/textile-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/textile-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 $srcdir/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# vim:set ts=2 sw=2 et:
