# Contributor: kevku <kevku@msn.com>
# Contributor: zhuqin <zhuqin83@gmail.com>
pkgname=gmlive-svn
_pkgname=gmlive
pkgver=338
pkgrel=2
pkgdesc="A live video for linux, powered by mms, sopcast and nslive."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtkmm' 'mplayer')
makedepends=('subversion')
if [[ "$CARCH" == 'i686' ]]; then
optdepends=('sopcast: sopcast support')
else
optdepends=('bin32-sopcast: sopcast support')
fi
url="http://code.google.com/p/gmlive/"
provides=('gmlive=0.22.3')

_svntrunk=http://$_pkgname.googlecode.com/svn/trunk/
_svnmod=$_pkgname

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
  cd "$srcdir/$_svnmod-build"

  #uncomment "--enable-plugin" if you need totem plugin support.
  ./autogen.sh --prefix=/usr #--enable-plugin
  make
}
package(){
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install
}
