# Contributor: Brix <brix@brix-verden.dk>

pkgname=tango-ldc-trunk
pkgver=5704
pkgrel=1
pkgdesc="The Tango standard library for the D programming language with LDC runtime. Includes the concurrent garbage collector."
arch=('i686', 'x86_64')
url="http://dsource.org/projects/tango"
depends=('ldc1')
makedepends=('subversion' 'fakeroot')
license=('custom')
provides=('libtango' 'libtango-ldc' 'd-stdlib-tango')
conflicts=('libphobos' 'libtango' 'libtango-ldc-svn' 'd-stdlib-tango')
source=('build.sh')

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

	if [ $arch == "i686" ]; then
		export ARCH=32
		sh $srcdir/build.sh

	  cp $srcdir/tango/lib32/*.a ${pkgdir}/usr/lib
	else
		export ARCH=64
		sh $srcdir/build.sh

  	cp $srcdir/tango/lib64/*.a ${pkgdir}/usr/lib
	fi



  cp -r object.di tango ${pkgdir}/usr/include/d || return 1
  find ${pkgdir} -depth -type d -name ".svn" -exec rm -r {} ';'
}
md5sums=('75d04f0582d2d45a454bb1afedf183d7')
