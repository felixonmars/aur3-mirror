# Maintainer: Bart Verhoeven <nepherte at archlinux dot us>

pkgname=smarteiffel-svn
pkgver=9377
pkgrel=2
pkgdesc="GNU Eiffel Compiler"
arch=('i686' 'x86_64')
url="http://smarteiffel.loria.fr"
license=('GPL')
depends=('gcc')
makedepends=('subversion')
source=('serc')
provides=('smarteiffel')
conflicts=('smarteiffel')
md5sums=('6f7a9f55b2b8ee9d492a03367b36caa8')

_svntrunk="svn://scm.gforge.inria.fr/svn/smarteiffel/trunk"
_svnmod="smarteiffel"

build() {
  cd $srcdir

  # Checkout latest version
  msg "Checkout latest svn version"
  if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
  else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  # Copy to a build directory
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

  # Replace variable with location of the eiffel installation dir
  sed -i "s|@EIFFEL_HOME|$(pwd)|g" $srcdir/serc
 
  # build and package SmartEiffel
  SmartEiffel=$srcdir/serc \
    make \
    USRDIR=$pkgdir/usr \
    DOCDIR=$pkgdir/usr/share/doc \
    ETCDIR=$pkgdir/etc \
    SE_PREFIX=$pkgdir \
    install

  # Clean up build directory
  rm -rf $_svnmod-build
}
