# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-pycsp
pkgver=0.7.0
pkgrel=1
pkgdesc="The PyCSP project is an on-going project to bring CSP (Communicating Sequential Processes) to Python."
url="http://pycsp.googlecode.com"
arch=('i686' 'x86_64')
license=('MIT')
depends=( 'python')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pycsp.googlecode.com/files/pycsp-$pkgver.tar.gz)
md5sums=('66e2390780395e06a0c8f502108948d0')

build() {
  cd $startdir/src/pycsp-$pkgver
  
  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$startdir/pkg
}
