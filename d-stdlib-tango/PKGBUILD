# Contributor: BeholdMyGlory <larvid@gmail.com>
# Contributor: Brix <brix@brix-verden.dk>

pkgname=d-stdlib-tango
pkgver=0.99.9
pkgrel=1
pkgdesc="The Tango standard library for the D programming language with LDC runtime."
arch=('i686', 'x86_64')
url="http://dsource.org/projects/tango"
depends=('d-compiler-ldc')
makedepends=('subversion')
license=('custom')
provides=('libtango' 'libtango-ldc')
conflicts=('libphobos' 'libtango' 'libtango-ldc-svn')
source=('tango-0.99.9.patch')
md5sums=('f24a3fc6548708c6e60944bff14621cf')

svntrunk=http://svn.dsource.org/projects/tango/tags/releases/0.99.9
svnmod=tango

build() {
  cd ${srcdir}

  if [ -d $svnmod/.svn ]; then
    (cd $svnmod && svn up)
  else
    svn co $svntrunk --config-dir ./ $svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $svnmod

  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include/d

  patch -p0 < ${srcdir}/tango-0.99.9.patch

  if [ "$CARCH" = 'x86_64' ]; then
    ./build/bin/linux64/bob . -c=ldc -p=linux -r=ldc -l=libtango-user-ldc
  else
    ./build/bin/linux/bob . -c=ldc -p=linux -r=ldc -l=libtango-user-ldc
  fi
  
  cp libtango-user-ldc.a ${pkgdir}/usr/lib
  
  cp -r object.di tango ${pkgdir}/usr/include/d || return 1
  find ${pkgdir} -depth -type d -name ".svn" -exec rm -r {} ';'
}
