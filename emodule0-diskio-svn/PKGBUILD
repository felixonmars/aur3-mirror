# PrinceAMD

pkgname=emodule0-diskio-svn
pkgver=37714
pkgrel=1
pkgdesc="very cool module"

arch=('i686' 'x86_64')
license=('GPL')
depends=('bash' 'x-server')
makedepends=('subversion')
provides=('emodule0-diskio')
url=http://svn.enlightenment.org/svn/e/trunk/E-MODULES-EXTRA/diskio
source=()
md5sums=()

_svntrunk=http://svn.enlightenment.org/svn/e/trunk/E-MODULES-EXTRA/diskio
_svnmod=diskio

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh

  ./configure 
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}
# vim:syntax=sh
