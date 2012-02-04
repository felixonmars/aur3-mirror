# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: rabyte <rabyte__gmail>
 
pkgname=python-pyode
pkgver=1.2.0
pkgrel=1
pkgdesc="A set of open-source Python bindings for The Open Dynamics Engine (ODE)"
arch=('i686' 'x86_64')
url="http://pyode.sourceforge.net/"
license=('LGPL2.1')
depends=('python2>=2.2' 'ode>=0.7')
optdepends=('pyrex: (required for PyODE development)')
source=(http://downloads.sourceforge.net/pyode/PyODE-$pkgver.tar.bz2)
md5sums=('ab72f3acc635371fd454978e5a97591c')
 
build() {
  cd $srcdir/PyODE-$pkgver
 
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir
}
