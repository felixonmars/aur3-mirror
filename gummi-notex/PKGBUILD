# Maintainer: Erik Huemer <erik.huemer@gmail.com>
pkgname=gummi-notex
pkgver=0.6.5
pkgrel=1
pkgdesc="Simple LaTeX editor for GTK users - 0.6.5 (without texlive-core dependency)"
arch=('i686' 'x86_64')
url="http://gummi.midnightcoding.org"
license=('MIT')
depends=('desktop-file-utils' 'poppler-glib' 'gtksourceview2' 'gtkspell')
makedepends=('intltool')
optdepends=('texlive-core: ArchLinux provided LATEX support')
provides=('gummi-notex')
conflicts=('gummi')
source=(http://dev.midnightcoding.org/attachments/download/301/gummi-$pkgver.tar.gz)
noextract=()
md5sums=('da6b8736fd42ab3f5a9703a7a7917a7d') #generate with 'makepkg -g'

build() {
  cd "$srcdir/gummi-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/gummi-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
