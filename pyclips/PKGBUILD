# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Author: Stefano 'jht' <stefano@inventati.org>

pkgname=pyclips
pkgver=1.0.7.348
pkgrel=1
pkgdesc='Python binding for Clips' 
url='http://pyclips.sourceforge.net/' 
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2')
source=(http://downloads.sourceforge.net/sourceforge/pyclips/pyclips-${pkgver}.tar.gz)
md5sums=('c548d62ec951bf9f98c86c70815ed27c')

build() { 
  cd pyclips

  python2 setup.py build
}

package() {
  cd pyclips

  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
