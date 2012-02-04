# Maintainer: Joe Olivas <olivasj@ecs.csus.edu> Arak <arak.hx@gmail.com>
# Contributor: Joe Olivas <olivasj@ecs.csus.edu>
pkgname=python-fam
pkgver=1.1.1
pkgrel=2
pkgdesc="Python bindings to the File Alteration Monitor (famd)"
arch=('i686')
url="http://python-fam.sf.net"
license=""
depends=('python' 'fam')
replaces=()
source=("http://dl.sourceforge.net/python-fam/$pkgname-$pkgver.tar.gz" "python-fam-1.1.1-2.diff")

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np2 -i ${startdir}/src/python-fam-1.1.1-2.diff || return 1
  python setup.py build
  python setup.py install --root=$startdir/pkg
}
md5sums=('f6c760c6d8e5ea69a3fce029f7973558')
