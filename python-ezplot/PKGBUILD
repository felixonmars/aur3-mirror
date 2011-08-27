# $Id$
# Maintainer: Sebastien Binet <binet@cern.ch>
pkgname=python-ezplot
pkgver=0.1.0a4
pkgrel=1
pkgdesc="Remote Procedure interface to Matplotlib"
url="http://www.billbaxter.com/projects/ezplot"
arch=('i686' 'x86_64')
license="BSD"
depends=( 'python-matplotlib' 'twisted' )
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www.billbaxter.com/projects/ezplot/ezplot-$pkgver.tar.gz)
md5sums=('d4c96ed8ef5f19a50ea82b4b5bfa9002')

build() {
  cd $startdir/src/ezplot-$pkgver
  python setup.py install --prefix=/usr --root=$startdir/pkg
  ## remove the python-egg infos: we don't need them, we have pacman :)
  /bin/rm -rf $startdir/pkg/usr/lib/python*/site-packages/*egg*
}
