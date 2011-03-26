# Maintainer: evr <evanroman at gmail>
pkgname=gray-matter-svn
pkgver=1590
pkgrel=1
pkgdesc="An xboard compatible chess engine written in C++"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gray-matter/"
license=('GPL3')
makedepends=(subversion)
install=${pkgname}.install

_svntrunk=http://gray-matter.googlecode.com/svn/trunk/
_svnmod=gray-matter

build() {
  cd $srcdir

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r $pkgver)
  else
    svn co ${_svntrunk} --config-dir ./ -r $pkgver $_svnmod
  fi

  cp -r ${_svnmod} $_svnmod-build
  cd ${_svnmod}-build

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  make || return 1

  install -D bin/gray ${pkgdir}/usr/bin/gray || return 1
  install -D -m644 graymatter.conf.sample ${pkgdir}/usr/share/graymatter/graymatter.conf.sample || return 1

  rm -rf ${srcdir}/${_svnmod}-build
}
