# Contributor: Adam Hirst (aphirst) - aphirst-AT-archlinux-DOT-co-DOT-uk
pkgname=dslash-svn
pkgver=57
pkgrel=1
pkgdesc="The SVN Version of the effective CLI Nintendo DS ROM Trimmer."
arch=('i686' 'x86_64')
url="http://code.google.com/p/dslash/"
license=('GPL')

makedepends=('subversion')
conflicts=('dslash')
provides=('dslash')

source=()
md5sums=()

_svntrunk=http://dslash.googlecode.com/svn/trunk/
_svnmod=dslash-read-only

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

  make || return 1
  mkdir -p ${pkgdir}/usr/bin
  cp dslash ${pkgdir}/usr/bin/

#  rm -rf ${srcdir}/$_svnmod-build
}
