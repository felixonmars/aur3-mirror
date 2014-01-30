# Maintainer: Aaron Paden <aaronbpaden@gmail.com>

pkgname=xournal-gtk3-git
pkgver=r201.9595350
pkgrel=1
pkgdesc="Notetaking and sketching application. Gtk3 branch."
arch=('i686' 'x86_64')
url="http://xournal.sourceforge.net/"
license=('GPL')
depends=(
  'goocanvas' 'gtk3' 'poppler-glib'
  'shared-mime-info' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('ghostscript: import PS/PDF files as bitmap backgrounds')
makedepends=('git')
provides=('xournal')
conflicts=('xournal')
install=install
_gitname=xournal
source=("$_gitname::git+https://github.com/dmgerman/xournal.git#branch=gtk3")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install desktop-install
}

# vim:set ts=2 sw=2 et:
