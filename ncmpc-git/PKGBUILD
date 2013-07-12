# Contributor: Rasi <rasi@xssn.at>

pkgname=ncmpc-git
pkgver=release.0.20.43.gd990c74
pkgrel=1
pkgdesc="ncmpc - bleeding edge git version." 
arch=('i686' 'x86_64')
url="http://www.musicpd.org/ncmpc.shtml"
license=('GPL2')
depends=('python' 'expat' 'glib2' 'ncurses' 'libmpdclient')
makedepends=('git' 'autoconf' 'automake' 'doxygen')
conflicts=('ncmpc' 'ncmpc-svn')
source=('git://git.musicpd.org/master/ncmpc.git')
md5sums=()
_gitname="ncmpc"
pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}
build() {
  cd $_gitname
  ./autogen.sh \
  --prefix=/usr \
  --enable-lyrics-screen \
  --enable-colors \
  --enable-help-screen \
  --enable-mouse \
  --enable-search-screen \
  --enable-song-screen \
  --enable-chat \
  --enable-key-screen \
  --enable-lyrics-screen \
  --enable-outputs-screen \
  --enable-chat-screen \
  --enable-documentation \
  --enable-artist-screen
    make || return 1
}
package() {
    cd "$_gitname"
    make DESTDIR=$pkgdir prefix=/usr install
} 
md5sums=('SKIP')
