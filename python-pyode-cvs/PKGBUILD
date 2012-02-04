# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=python-pyode-cvs
pkgver=20061208
pkgrel=1
pkgdesc="Python bindings for ODE, the Open Dynamics Engine"
url="http://pyode.sourceforge.net"
license=("LGPL" "BSD")
depends=('python' 'ode')
makedepends=('cvs' 'pyrex')
conflicts=('python-pyode')
provides=('python-pyode')
replaces=()
backup=()
install=
source=()
md5sums=()

_cvsroot=:pserver:anonymous@pyode.cvs.sourceforge.net:/cvsroot/pyode
_cvsmod=pyode

build() {
  cd $startdir/src

  msg "Connecting to the CVS server...."
  cvs -z3 -d$_cvsroot co -D $pkgver -f -P $_cvsmod

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r $_cvsmod $_cvsmod-build
  cd $_cvsmod-build

  python setup.py install --prefix=/usr --root=$startdir/pkg
}
