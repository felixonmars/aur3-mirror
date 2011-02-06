# Contributor: Brix <brix@brix-verden.dk>

pkgname=d-lib-arc
pkgver=1607
pkgrel=1
pkgdesc="ArcLib is a library for creating 2D games, for the D Programming Language."
url="http://dsource.org/projects/arclib"
depends=('d-lib-derelict')
makedepends=('subversion')
arch=('i686', 'x86_64')
license=('custom')
source=('arc-tango.patch')
md5sums=('9172e750ea24b6a9d7cb5e7ab0aa686c')

_svntrunk=http://svn.dsource.org/projects/arclib/trunk/
_svnmod=arclib

build() {
  cd ${srcdir}
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi
  
  msg "SVN checkout done or server timeout"
  
  cd $_svnmod
  
  patch -p0 < ${srcdir}/arc-tango.patch
  
  mkdir -p ${pkgdir}/usr/include/d
  
  cp -r arc ${pkgdir}/usr/include/d || return 1
  
  find ${pkgdir} -depth -type d -name ".svn" -exec rm -r {} ';'
}
