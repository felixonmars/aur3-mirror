# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from SVN sources.

# Maintainer: Nathan Sweetman <nathan.sweetman@gmail.com>
pkgname=vimpc-svn
pkgver=671
pkgrel=1
pkgdesc="ncurses based MPD client with vi-like key bindings"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/vimpc/"
license=('GPL3')
depends=('libmpdclient' 'ncurses' 'pcre')
makedepends=('subversion')
provides=('vimpc')
conflicts=('vimpc')
source=("vimpc::svn+https://vimpc.svn.sourceforge.net/svnroot/vimpc/trunk")
md5sums=('SKIP')

pkgver() {
    cd "$SRCDEST/vimpc"
    svnversion
}

build() {
  cd "$srcdir/vimpc"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/vimpc"
  make DESTDIR="$pkgdir/" install
}

