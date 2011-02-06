# Contributor: Brix <brix@brix-verden.dk>

pkgname=d-lib-mango
pkgver=1141
pkgrel=1
pkgdesc="Mango is a network oriented library for the D programming language with LDC runtime."
arch=('i686', 'x86_64')
url="http://dsource.org/projects/mango"
depends=('d-stdlib-tango')
makedepends=('subversion')
license=('custom')
conflicts=('mango-ldc-svn')

_svntrunk=http://svn.dsource.org/projects/mango/trunk
_svnmod=mango

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

  mkdir -p ${pkgdir}/usr/include/d

  cp -r mango ${pkgdir}/usr/include/d || return 1
  
  find ${pkgdir} -depth -type d -name ".svn" -exec rm -r {} ';'
}
