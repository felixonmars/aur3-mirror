# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=gummi-git
pkgver=890
pkgrel=1
pkgdesc="Simple LaTeX editor for GTK users - latest git"
arch=('i686' 'x86_64')
url="http://gummi.midnightcoding.org/"
license=('custom')
depends=('poppler-glib' 'gtksourceview2' 'desktop-file-utils' 'gtkspell')
makedepends=('git')
provides=('gummi')
conflicts=('gummi')
install=gummi.install
source=("gummi.orig::git+https://github.com/alexandervdm/gummi.git")
md5sums=('SKIP')
_gitname="gummi.orig"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git rev-list --count HEAD
}

prepare() {
  sed -i 's+-1.14++' "$srcdir"/"$_gitname"/autogen.sh
}

build() {
  cd "$srcdir"/"$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING 
}
