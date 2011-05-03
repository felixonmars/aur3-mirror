# Maintainer:  <clu>

pkgname=python-pyds9  
pkgver=1.2
pkgrel=3
pkgdesc="A Python Connection to DS9 via XPA"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python2')
makedepends=('python2' 'python2-distribute')
optdepends=('ds9-bin: astronomical data visualization application')
conflicts=()
replaces=()
backup=()
source=(http://hea-www.harvard.edu/saord/download/ds9/python/pyds9-$pkgver.tar.gz)
md5sums=('abffc3cfa371b141dc5fb4f3c84d0b57')

build() {
  cd $srcdir/pyds9-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/pyds9-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1 
}
