# Contributor: BeholdMyGlory <larvid@gmail.com>
# Contributor: Brix <brix@brix-verden.dk>

pkgname=d-stdlib-tango-trunk
pkgver=5658
pkgrel=1
pkgdesc="The Tango standard library for the D programming language with LDC runtime."
arch=('i686', 'x86_64')
url="http://dsource.org/projects/tango"
depends=('d-compiler-ldc')
makedepends=('subversion')
license=('custom')
provides=('libtango' 'libtango-ldc' 'd-stdlib-tango')
conflicts=('libphobos' 'libtango' 'libtango-ldc-svn' 'd-stdlib-tango')

_svntrunk=http://svn.dsource.org/projects/tango/trunk
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

  sed -e 's/-Itango\/core -Itango\/core\/vendor/-Itango\/core -Itango\/core\/vendor -Itango\/core\/rt\/compiler\/ldc/g' ./build/script/bob.sh > ./build/script/bob_.sh
  chmod +x ./build/script/bob_.sh
  ./build/script/bob_.sh --runtime ldc

  cp libtango.a ${pkgdir}/usr/lib

  cp -r object.di tango ${pkgdir}/usr/include/d || return 1
  find ${pkgdir} -depth -type d -name ".svn" -exec rm -r {} ';'
}
