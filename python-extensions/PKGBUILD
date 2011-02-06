# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@farnsworth>
pkgname=python-extensions
pkgver=0.4
pkgrel=1
pkgdesc="Simple plugin system"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/extensions"
license=('GPL2')
depends=('python')
source=(http://pypi.python.org/packages/source/e/extensions/extensions-$pkgver.tar.gz)
md5sums=('e498fe6da146aefb677c3e8a210fbb29')

build() {
  cd $startdir/src/extensions-$pkgver
  python setup.py install --prefix=$startdir/pkg/usr || return 1
}
