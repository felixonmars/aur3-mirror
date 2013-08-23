# Contributor:  Vincent Kriek <vincent@vincentkriek.nl>
# Maintainer:  Daniel Nagy < danielnagy at gmx de>

pkgname=htop-svn
pkgver=308
pkgrel=1
pkgdesc="Interactive process viewer (from SVN)"
arch=('i686' 'x86_64')
url="http://htop.sourceforge.net/"
license=('GPL')
depends=('ncurses')
makedepends=('subversion' 'python2')
conflicts=('htop')
provides=('htop')
source=("svn+https://htop.svn.sourceforge.net/svnroot/htop/trunk")
sha1sums=("SKIP")

pkgver() {
  cd "$srcdir"/trunk
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir"/trunk

  sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure.ac
  sed -i 's|python|python2|' scripts/MakeHeader.py

  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --enable-unicode \
      --enable-openvz \
      --enable-vserver \
      --enable-cgroup

  make
}

package() {
  cd "$srcdir"/trunk
  make DESTDIR="$pkgdir" install
}
