# Contributor:  
# Contributor:  
# Maintainer:   

pkgname=libnut-svn
pkgver=676
pkgrel=1
pkgdesc="Library and tools to create NUT multimedia files"
arch=('i686' 'x86_64')
url="http://wiki.multimedia.cx/index.php?title=NUT"
license=('GPL')
depends=()
makedepends=()
conflicts=('libnut')
provides=('mplayer')
source=('libnut-shared.patch')
md5sums=('cc8ca93010fa05c529d1c2b0bebb473d')

_svntrunk="svn://svn.mplayerhq.hu/nut"
_svnmod="nut"

build() {
	
  
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build/src/trunk"

  #patch -p0 -E --backup --verbose -i "$srcdir/libnut-shared.patch"

  sonamever="$(grep NUT_VERSION libnut/libnut.h | awk '{print $3}')"  || exit 1
  
  [ "$CARCH" = "x86_64" ] && SLKCFLAGS="-O2 -fPIC" && sed -i -e \
           "s|-Os|${SLKCFLAGS}|g" config.mak || exit 1
  
  make SONAME=$sonamever || exit 1
  
  
}

package() {
   
  cd "$srcdir/$_svnmod-build/src/trunk"
  make install SONAME=$sonamever  PREFIX=/usr DESTDIR=$pkgdir || exit 1

  rm -rf "$srcdir/$_svnmod-build"
}
