# Contributor: Henrik Nymann Jensen <h@henriknj.dk>
pkgname=pykdeextensions
pkgver=0.4.0
pkgrel=1
pkgdesc="A collection of software and Python packages to support creation/install of KDE apps"
arch=(i686 x86_64)
url="http://www.simonzone.com/software/pykdeextensions/"
license=('LGPL')
depends=('python' 'pykde')
source=(http://www.simonzone.com/software/pykdeextensions/$pkgname-$pkgver.tar.gz)
md5sums=('5249c7288c1b2bed44a2d91111d3313a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root=$startdir/pkg || return 1
}
