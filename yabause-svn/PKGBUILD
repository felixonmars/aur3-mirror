pkgname=yabause-svn
pkgver=2996
pkgrel=2
pkgdesc="A Sega Saturn emulator. (svn)"
arch=(i686 x86_64)
license=("GPL")
depends=(gtkglext sdl freeglut)
makedepends=(subversion)
url="http://yabause.org"
conflicts=(yabause yabause-qt yabause-qt-svn)
provides=(yabause)
_svntrunk="https://yabause.svn.sourceforge.net/svnroot/yabause/trunk"
_svnmod="yabause"

build() {
  cd "${srcdir}"

  if [ -d "${_svnmod}/.svn" ]; then
    (cd "$_svnmod" && svn up -r $pkgver)
  else
    svn co "$_svntrunk" --config-dir ./ -r $pkgver $_svnmod
  fi

  msg 'SVN checkout done or server timeout'

  rm -rf "${_svnmod}-build"
  cp -r "$_svnmod" "${_svnmod}-build"
  cd "${_svnmod}-build/yabause"

  ./autogen.sh
  ./configure --prefix=/usr LIBS="-lm"
  make
}

package() {
  cd "${srcdir}/${_svnmod}-build/yabause"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
