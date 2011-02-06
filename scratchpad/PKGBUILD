# Contributor: Sylphe <florent.odier.at.gmail.com>
pkgname=scratchpad
pkgver=0.3.0
pkgrel=6
pkgdesc="A spatial text editor for the GNOME desktop"
arch=(i686)
url='http://dborg.wordpress.com/scratchpad'
license=('GPL')
depends=('gtksourceview' 'gnome-vfs' 'gconf>=2.18.0.1-4' 'desktop-file-utils')
install=scratchpad.install
source=("http://scratchpad.googlecode.com/files/$pkgname-$pkgver.tar.bz2")
md5sums=('12ec467f5670150a79964c00f593157c')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr --with-gconf-schema-file-dir=/usr/share/gconf/schemas || return 1
  make || return 1

  mkdir -p "$pkgdir"/usr/share/gconf/schemas
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install || return 1
}
