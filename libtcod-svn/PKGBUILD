# Maintainer: Michal Kowalski <kowalski TOD michal TA gmail TOD com>
# Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=libtcod-svn
_rpkgname=libtcod
pkgver=494
pkgrel=2
pkgdesc="Roguelike graphics/utility library"
arch=('i686' 'x86_64')
url="http://doryen.eptalys.net/libtcod/"
license=('BSD')
groups=('ypb')
depends=('sdl' 'libpng' 'zlib' 'libgl' 'gcc-libs' 'libx11')
makedepends=('cmake' 'subversion' 'upx')
conflicts=('libtcod-beta' 'libtcod-hg' 'libtcod')
provides=('libtcod')
#options=(!strip)
source=('png.patch'
        'cmake.patch')
md5sums=('fd3417b535ad0dbf91eeffd42202b81e'
         '9968e42f7f7e06d333fadb0e134eda00')

_svntrunk=http://doryen.eptalys.net/svn-libtcod/trunk
_svnmod=libtcod
_makedir=cmake/Release
_prefix=/usr

build() {
  cd $srcdir  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver) || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
  fi

  rm -fr $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  patch -p0 < ../png.patch
  patch -p0 < ../cmake.patch

  mkdir -p $_makedir
  cd $_makedir
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${_prefix} -G "Unix Makefiles" $srcdir/$_svnmod-build &&
  make || return 1
}

package() {
  cd $srcdir/$_svnmod-build/$_makedir
  make DESTDIR=$pkgdir install || return 1
#  strip --strip-unneeded $pkgdir/${_prefix}/lib/${_rpkgname}*.so
  rm -rf "$pkgdir/${_prefix}/share"
  install -D -m644 "$srcdir/$_svnmod-build/LIBTCOD-LICENSE.txt" "$pkgdir/usr/share/licenses/${_rpkgname}/LICENSE"
  install -D -m644 "$srcdir/$_svnmod-build/LIBTCOD-CREDITS.txt" "$pkgdir/usr/share/licenses/${_rpkgname}/CREDITS"
}

