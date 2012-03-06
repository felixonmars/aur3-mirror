# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-rhodecode
pkgver=1.3.3
pkgrel=1
pkgdesc="Mercurial repository browser/management with build in push/pull server and full text search"
url="http://rhodecode.org"
arch=('any')
license=('GPL')
depends=( 'python2' 'mercurial' 'pylons' 'python-paste')
optdepends=('python-celery')
source=(http://pypi.python.org/packages/source/R/RhodeCode/RhodeCode-$pkgver.tar.gz)
md5sums=('f97b9d644b7d27f274f05d67d647a351')

build() {
  cd $startdir/src/RhodeCode-$pkgver
  
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$startdir/pkg
}
