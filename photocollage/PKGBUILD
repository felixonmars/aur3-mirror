# $Id$
# Maintainer: Dariusz Duma <dhor@toxic.net.pl>

pkgname=photocollage
pkgver=1.3.0
pkgrel=1
pkgdesc="PhotoCollage allows you to create photo collage posters"
arch=('any')
url="https://github.com/adrienverge/PhotoCollage"
license=('LGPL')
depends=('python-pillow' 'python-gobject')
makedepends=('python-distutils-extra')
# install=$pkgname.install
source=(https://github.com/adrienverge/PhotoCollage/archive/v$pkgver.tar.gz)
md5sums=('d5c331e222fa7265c84b57060d516302')

#build() {
#}

package() {
  cd "$srcdir/PhotoCollage-$pkgver"
  python setup.py install --prefix=/usr --root=${pkgdir} 
}

