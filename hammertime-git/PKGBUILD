# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=hammertime-git
pkgver=0.236.fe3ada9
pkgrel=1
pkgdesc="Hammertime for rackspace"
arch=('x86_64' 'i686')
url="https://github.rackspace.com/matt-martz/hammertime"
license=('unknown')
depends=('python2-yaml' 'python2-soappy' 'python2-pexpect' 'python2-argparse' 'expect')
makedepends=('git' 'python2-distribute')
source=("$pkgname::git://github.rackspace.com/matt-martz/hammertime.git")
md5sums=('SKIP')

pkgver(){
  cd $srcdir/$pkgname
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $srcdir/$pkgname
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname
  python2 setup.py install --root "$pkgdir" --optimize 1
}

# vim:set ts=2 sw=2 et:
