# Maintainer: Moritz Lipp <mlq@pwmt.org>

_girara_gtk_version=2

pkgname=girara-gtk$_girara_gtk_version-git
pkgver=0.1.8.0.g21a0c22
pkgrel=1
pkgdesc="user interface library"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/girara"
license=('custom')
depends=('gtk2>=2.18' 'girara-common-git')
makedepends=('git')
source=('girara::git+git://pwmt.org/girara')
md5sums=('SKIP')
_gitname=girara

conflicts=(girara-gtk$_girara_gtk_version)
provides=(girara-gtk$_girara_gtk_version)

build() {
  cd "$srcdir/$_gitname"
  make GIRARA_GTK_VERSION=$_girara_gtk_version
}

package() {
  cd "$srcdir/$_gitname"

  # install files
  make GIRARA_GTK_VERSION=$_girara_gtk_version DESTDIR="$pkgdir/" install

  # remove common files
  rm -r "$pkgdir/usr/include"
  rm -r "$pkgdir/usr/share"

  # install license
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

# vim:set ts=2 sw=2 et:
