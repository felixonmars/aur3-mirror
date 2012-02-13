# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@farnsworth>
pkgname=python-bpt
pkgver=0.5.2
pkgrel=2
pkgdesc="Tool to create isolated environments"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/bpt"
license=('GPL')
depends=('python2')
source=(http://pypi.python.org/packages/source/b/bpt/bpt-$pkgver.tar.gz)
md5sums=('422780bcc12574b3c3651cb0ba6790e0')

build() {
  cd $startdir/src/bpt-$pkgver
  python2 setup.py install --root=$startdir/pkg --prefix=/usr || return 1
}
