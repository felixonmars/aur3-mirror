# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-cyrano
pkgver=0.1.4
pkgrel=1
pkgdesc="Cyrano is a tool used for demonstrating Python packages that combines a display window and an IPython shell."
url="http://stsdas.stsci.edu/cyrano"
arch=('i686' 'x86_64')
license=('BSD')
depends=('ipython' 'python-pmw')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://stsdas.stsci.edu/cyrano/cyrano-${pkgver}.tar.gz)
md5sums=('5ba2fb588dd6c10385de34b4a46d8966')

build() {
  cd $startdir/src/cyrano-$pkgver
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
