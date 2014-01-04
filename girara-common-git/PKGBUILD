# Maintainer: mlq <mlq@pwmt.org>

pkgname=girara-common-git
pkgver=0.1.9.11.g12540d5
pkgrel=1
pkgdesc="user interface library (common files)"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/libgirara"
license=('custom')
makedepends=('git')
conflicts=('girara-common')
provides=('girara-common')
source=('girara::git+git://pwmt.org/girara#branch=develop')
md5sums=('SKIP')
_gitname=girara

package() {
  cd "$srcdir/$_gitname"

  # install header
  make DESTDIR="$pkgdir/" install-headers

  # install language files
  make DESTDIR="$pkgdir/" -C po install

  # remove pkgconfig files
  rm -r $pkgdir/usr/lib/pkgconfig

  # install license
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

# vim:set ts=2 sw=2 et:
