# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-fwrap
pkgver=0.1.1
pkgrel=1
pkgdesc="Fwrap wraps Fortran code in C, Cython and Python."
url="http://fwrap.sourceforge.net/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python' 'python-numpy>=1.2' 'cython>=0.11')
makedepends=()
backup=()
install=
source=(http://downloads.sourceforge.net/project/fwrap/fwrap-$pkgver.tar.gz)
md5sums=('d55dbb04ebf692207c28e9f812392166')

build() {
  cd $startdir/src/fwrap-$pkgver
  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}