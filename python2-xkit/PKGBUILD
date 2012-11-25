# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=python2-xkit
pkgver=0.5.0
pkgrel=1
pkgdesc="library for manipulation of xorg.conf files"
arch=('any')
url="http://packages.ubuntu.com/quantal/python-xkit"
license=('GPL')
depends=('python2')
makedepends=('python2-distribute')
source=(http://archive.ubuntu.com/ubuntu/pool/main/x/x-kit/x-kit_0.5.0.tar.gz)

package() {
  cd "$srcdir/xorgparser"
  python2 setup.py install --root "$pkgdir"
  ln -s xkit "$pkgdir/usr/lib/python2.7/site-packages/XKit"
}

# vim:set ts=2 sw=2 et:
md5sums=('bf8d2c27c6d91b0b854826f9aeacc9fa')
