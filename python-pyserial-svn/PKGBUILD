# Contributer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Maintainer: Thomas Burdick <thomas.burdick@gmail.com>

pkgname=python-pyserial-svn
pkgver=381
pkgrel=1
pkgdesc="Multiplatform Serial Port Module for Python"
arch=('any')
url="http://pyserial.sf.net"
license=('custom:PYTHON')
makedepends=('subversion')
depends=('python')
source=()
md5sums=()
_svntrunk=https://pyserial.svn.sourceforge.net/svnroot/pyserial/trunk/pyserial
_svnmod=pyserial

build() {
  cd $startdir/src
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
