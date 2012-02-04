# Contributor: Pierluigi <pierluigi88@gmail.com>

pkgname=wordpresslib
pkgver=1.0
pkgrel=2
pkgdesc="a python library to post and control a wordpress installation"
url="http://www.blackbirdblog.it/programmazione/progetti/28"
license="LGPL"
depends=('python2')
makedepends=()
arch=('i686' 'x86_64')
source=(http://www.blackbirdblog.it/download/software/wordpresslib.zip)
md5sums=('f69b6915a8407d2b947cca990b883951')

build() {
  cd $startdir/src/
  python2 setup.py install --root=$startdir/pkg/
}
