# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=latexila-git
pkgver=2.8.1.1.gde153d2
pkgrel=1
pkgdesc="Integrated LaTeX environment for GNOME (from git)"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/latexila"
license=('GPL3')
depends=('gtksourceview3-git' 'libgee06' 'gtkspell3' 'gsettings-desktop-schemas' 'dconf' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git' 'itstool' 'vala-git' 'yelp-tools')
provides=("latexila=${pkgver%?????????}")
conflicts=('latexila' 'latexila-devel')
install=latexila.install
source=('git://git.gnome.org/latexila')
md5sums=('SKIP')
_gitname="latexila"

pkgver() {
  cd $srcdir/$_gitname
  git describe --always | sed 's|-|.|g' 
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
