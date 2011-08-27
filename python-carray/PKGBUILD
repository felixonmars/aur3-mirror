# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-carray
pkgver=0.4
pkgrel=1
pkgdesc="carray is a container for numerical data that can be compressed in-memory."
url="http://github.com/FrancescAlted/carray"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2' 'python2-numpy>=1.2' 'python-pytables' 'cython' 'python-numexpr')
makedepends=()
backup=()
install=
source=(http://carray.pytables.org/download/stable/carray-$pkgver.tar.gz)
md5sums=('8c884161c464b28d912e8a50d04e1987')

build() {
  cd $startdir/src/carray-$pkgver
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1

  # install custom licence
  install -d $pkgdir/usr/share/licenses/python-carray || return 1
  install $srcdir/carray-$pkgver/LICENSES/CARRAY.txt $pkgdir/usr/share/licenses/python-carray/LICENSE || return 1
}