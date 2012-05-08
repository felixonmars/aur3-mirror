# Contributor: Chrysalis <mindaxis[at]gmail[dot]com>
# Contributor: andrew <andrew[at]andrewyates[dot]net>

pkgname=gtkevemon-mercurial
pkgver=134
pkgrel=1
pkgdesc="GTK clone of EveMon skill monitor for EVE Online"
arch=('i686' 'x86_64')
url="http://gtkevemon.battleclinic.com/index.html"
license=('GPL3')
depends=('gtk2' 'gtkmm' 'libxml2')
makedepends=('mercurial')
provides=('gtkevemon' 'gtkevemon-svn')
conflicts=('gtkevemon' 'gtkevemon-svn')
options=()
install=
source=(thread.patch)
md5sums=('a0c1c8e396a124fe2f67de8521b101cb') #generate with 'makepkg -g'

path=gtkevemon

build() {
  cd "$srcdir"

  if [ -d $path/.hg ]; then
		rm -rf $path
  fi
  
  hg clone https://bitbucket.org/BattleClinic/gtkevemon

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$path-build"
  cp -r "$srcdir/${path}/gtkevemon" "$srcdir/$path-build"
  cd "$srcdir/$path-build"
  
  patch $srcdir/$path-build/src/util/thread.h $srcdir/thread.patch
  
  make
}

package() {
  cd "${srcdir}/${path}-build"
  make INSTALL_BIN=$pkgdir/usr/bin \
    INSTALL_DIR_ICON=$pkgdir/usr/share/pixmaps \
    INSTALL_DIR_DESK=$pkgdir/usr/share/applications \
    install
}

# vim:set ts=2 sw=2 et:
