
# Contributor: Mathias L. Baumann <marenz@supradigital.org>
pkgname=sqlitepp-svn
pkgver=74
pkgrel=1
pkgdesc="C++ interface to sqlite3"
arch=('i686' 'x86_64')
url="http://sqlitepp.berlios.de/"
license=('Boost Software License')
depends=(boost)
makedepends=(boost boost-build sqlite3)
source=()
noextract=()
md5sums=() 

_svntrunk=https://svn.berlios.de/svnroot/repos/sqlitepp/trunk/
_svnmod=sqlitepp


build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  bjam utf8
  cp -r lib ${pkgdir}
  mkdir ${pkgdir}/usr
  cp -r include ${pkgdir}/usr

  cd ..
  rm -rf ${srcdir}/$_svnmod-build
  #would conflict with sqlite3
  rm ${pkgdir}/usr/include/sqlite3.h
}

# vim:set ts=2 sw=2 et:
