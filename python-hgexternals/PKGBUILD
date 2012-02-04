# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@farnsworth>
pkgname=python-hgexternals
pkgver=0.2
pkgrel=1
pkgdesc="Mercurial extension to simulate Subversion externals"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/hgexternals"
license=('BSD')
depends=('python' 'mercurial')
source=(http://pypi.python.org/packages/source/h/hgexternals/hgexternals-$pkgver.tar.gz)
md5sums=('832c5224f4923197704bb0b312b899b5')

build() {
  cd $startdir/src/hgexternals-$pkgver
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
