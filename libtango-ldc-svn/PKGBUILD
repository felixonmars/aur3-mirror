# Contributor: BeholdMyGlory <larvid@gmail.com>

pkgname=libtango-ldc-svn
pkgver=5401
pkgrel=1
pkgdesc="The Tango standard library for the D programming language, compiled for ldc."
arch=('i686')
url="http://dsource.org/projects/tango"
depends=('ldc-hg')
makedepends=('subversion')
license=('custom')
provides=('libtango' 'libtango-ldc')
conflicts=('libphobos' 'libtango')

_svntrunk=http://svn.dsource.org/projects/tango/trunk/
_svnmod=tango

build() {
  cd ${srcdir}
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod

  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include/d

  build/script/bob.sh --libname ${pkgdir}/usr/lib/libtango.a --verbose ldc || return 1

  cp -r object.di tango ${pkgdir}/usr/include/d || return 1

  find ${pkgdir} -depth -type d -name ".svn" -exec rm -r {} ';'

}
