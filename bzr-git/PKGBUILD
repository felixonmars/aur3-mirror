# Maintainer: Gour <gour@atmarama.net>
# Contributor: Atomisirsi <atomisirsi@gsklan.de>
pkgname=bzr-git
pkgver=0.6.8
pkgrel=1
pkgdesc="Plugin for bzr to work with git trees"
url="http://bazaar-vcs.org/BzrForeignBranches/Git"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python-dulwich' 'bzr')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('8f9f64787703750f38daf7c15162f75a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
