# Contributor: Berseker <berseker86 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=gnome-paint-bzr
pkgver=83
pkgrel=8
pkgdesc="Simple, easy to use paint program inspired by MS-Paint. BZR Version"
arch=('i686' 'x86_64')
url="https://launchpad.net/gnome-paint"
license=('GPL')
depends=('gtk2' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool' 'bzr')
provides=('gnome-paint')
conflicts=('gnome-paint')
replaces=('gnome-paint' 'gnome-paint-svn')
install=$pkgname.install
source=('gnome-paint::bzr+http://bazaar.launchpad.net/~gnome-paint-developers/gnome-paint/trunk/')
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
  # removing doc directory, only interesting for building
  rm -rf $pkgdir/usr/doc
} 
