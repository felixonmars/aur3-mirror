# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=pyalpmm-svn
pkgver=103
pkgrel=1
pkgdesc="The Python ALPM high-level API"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.infolexikon.de/code/pyalpmm"
depends=('python>=2.6.2')
makedepends=('swig' 'subversion')
conflicts=('pyalpmm')
provides=('pyalpmm')
source=()
md5sums=()

_svntrunk=svn://infolexikon.de/pyalpmm/trunk
_svnmod=pyalpmm

build() {
  cd ${srcdir}
  msg "Connecting to SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

  make || return 1
  make install DESTDIR=${pkgdir} || return 1
  install -Dm755 mmacman ${pkgdir}/usr/bin/mmacman || return 1
  install -Dm644 pyalpmm.conf ${pkgdir}/etc/pyalpmm.conf || return 1
}
