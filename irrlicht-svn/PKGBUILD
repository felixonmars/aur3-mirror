# Contributor: Adrián Chaves Fernández (Gallaecio) <adriyetichaves gmail.com>

pkgname=irrlicht-svn
_pkgname=irrlicht
pkgver=4055
_pkgver=1.8.0
pkgrel=1
pkgdesc="High performance realtime 3D graphics engine."
arch=('i686' 'x86_64')
url="http://irrlicht.sourceforge.net/"
license=('ZLIB')
depends=('bzip2' 'freeglut' 'libgl' 'libjpeg' 'libpng' 'zlib')
makedepends=('subversion')
provides=('irrlicht')
replaces=('irrlicht') # It will be this way until SuperTuxKart supports a stable release.
conflicts=('irrlicht')
source=(include-config.diff
	makefile-fixes.diff)
md5sums=('7ff49d8ddc50deac316f4e2141828f31'
         '87ea931c460eda957b5d6e752686705d')

#FORCE_VER=3843

_svntrunk="https://$_pkgname.svn.sourceforge.net/svnroot/$_pkgname/trunk"
_svnmod="$_pkgname"

build() {
  msg "Starting SVN checkout..."

  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build

  # Patches.
  #patch -uN "$srcdir/$_svnmod-build/include/IrrCompileConfig.h" "$srcdir/include-config.diff"
  #patch -uN "$srcdir/$_svnmod-build/source/Irrlicht/Makefile" "$srcdir/makefile-fixes.diff"

  sed -i -e '/^CXXFLAGS/s:-g.*::' \
	 -e '/^CXXFLAGS/s:-Wall::' \
	 -e '/^CFLAGS/s/:= -O3 -fexpensive-optimizations/+=/' \
	 -e 's:--no-export-all-symbols --add-stdcall-alias::' \
	 -e 's/0-SVN/0/' \
	 -e "/^INSTALL_DIR/s:=.*:= ${pkgdir}/usr/lib:" \
	 $srcdir/$_svnmod-build/source/Irrlicht/Makefile

  # Compilation.
  cd source/Irrlicht
  make sharedlib

  make NDEBUG=1
}

package() {
  cd "$srcdir/$_svnmod-build/source/Irrlicht"

  install -d $pkgdir/usr/share/licenses/$_pkgname \
             $pkgdir/usr/share/doc/$_pkgname

  make install

  cd $srcdir/$_svnmod-build/
  install -m644 readme.txt $pkgdir/usr/share/licenses/$_pkgname

  # Install documentation
  cp -r doc/* $pkgdir/usr/share/doc/$_pkgname
  rm -f $pkgdir/usr/share/doc/$_pkgname/*.txt

  cd $pkgdir/usr/lib
  ln -s libIrrlicht.so.$_pkgver libIrrlicht.so.1
  #ln -s libIrrlicht.so.$_pkgver libIrrlicht.so
}
