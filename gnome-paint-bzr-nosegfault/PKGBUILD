# Contributor: Andrew Wang < ??? at gmail dot com>
# Maintainer: Borja Ruiz <borja at libcrack dot so>
pkgname=gnome-paint-bzr-nosegfault
pkgver=85
pkgrel=1
pkgdesc="Simple, easy to use paint program inspired by MS-Paint. BZR nosegfault version by Andrew Wang"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~andrewwang43/gnome-paint"
license=('GPL')
depends=('gtk2' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool' 'bzr')
provides=('gnome-paint')
conflicts=('gnome-paint')
replaces=('gnome-paint' 'gnome-paint-svn')
install=$pkgname.install
# source=('gnome-paint::bzr+http://bazaar.launchpad.net/~gnome-paint-developers/gnome-paint/trunk/')
source=('gnome-paint::bzr+http://bazaar.launchpad.net/~andrewwang43/gnome-paint/nosegfault/')
md5sums=('SKIP')
_bzrmod="gnome-paint"

pkgver() {
  bzr version-info $srcdir/$_bzrmod --custom --template="{revno}\n"
}

prepare() {
  cd "$srcdir/$_bzrmod"
  sed -i 's+.png++' data/desktop/gnome-paint.desktop.in.in
  sed -i 's+;image;++' data/desktop/gnome-paint.desktop.in.in
}

build() {
  cd "$srcdir/$_bzrmod"
  LDFLAGS="$LDFLAGS -lm" ./configure --prefix=/usr 
  EXEEXT='' make 
}

package() {
  cd "$srcdir/$_bzrmod"
  make DESTDIR="$pkgdir/" install
  rm -rf $pkgdir/usr/doc
} 
