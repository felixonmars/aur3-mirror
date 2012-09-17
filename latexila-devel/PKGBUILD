# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=latexila-devel
_pkgname=latexila
pkgver=2.5.4
pkgrel=2
pkgdesc="Integrated LaTeX environment for GNOME (development release)"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/latexila/"
license=('GPL3')
depends=('gtksourceview3' 'libgee' 'gtkspell3' 'gsettings-desktop-schemas' 'dconf' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('itstool' 'vala>=0.17.3.1') # i.e. vala-devel or vala-git 
optdepends=('texlive-core: build documents')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
install=$_pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz)
sha256sums=('2674bc74eecbde2da9cb84dd7176488d885961f364b5c1663662fed00401a8c2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
