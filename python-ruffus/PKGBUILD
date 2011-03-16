# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-ruffus
pkgver=2.2
pkgrel=2
pkgdesc="Light-weight Python Computational Pipeline Management"
url="http://code.google.com/p/ruffus"
arch=('i686' 'x86_64')
license=('MIT')
depends=( 'python>=2.6')
source=(http://pypi.python.org/packages/source/r/ruffus/ruffus-$pkgver.tar.gz)
md5sums=('d96fc1b90ad58367f04538e7c9b07c95')

build() {
  cd $startdir/src/ruffus-$pkgver
  
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$startdir/pkg
}
