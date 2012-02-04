# Maintainer: David Zaragoza <david@zaragoza.com.ve>
pkgname=blokish
pkgver=0.9.4
pkgrel=1
pkgdesc="A clone of the Blokus game, with a rudimentary AI built in, and supports 4 player games."
arch=('i686' 'x86_64')
url="http://idav.ucdavis.edu/~dfalcant/projects.php?project_name=blokish_v0.9.4"
license=('GPL')
groups=()
depends=('wxgtk')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://downloads.sourceforge.net/project/blokish/blokish/v0.9.4%20%28compile%20patch%29/blokish_v0.9.4_clean.tgz'
        'blokish.png'
        'blokish.desktop')
noextract=()
md5sums=('c663359b30361e831f546e119a63f097'
         'a389bd2458534cb8eb7917b416238c1d'
         '325244e631f784085f30e76096223ff2')

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
  
  # Desktop icon
  install -Dm644 $startdir/blokish.png $pkgdir/usr/share/pixmaps/blokish.png
  install -Dm644 $startdir/blokish.desktop $pkgdir/usr/share/applications/blokish.desktop
}

