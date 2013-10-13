# Maintainer: Tony Crisci <tony at dubstepdish dot com>

pkgname=nagbar
pkgver=0.01
pkgrel=1
pkgdesc='An improved dynamic nagbar'
arch=('i686' 'x86_64')
url='https://github.com/acrisci/nagbar'
license=('BSD')
provides=('nagbar')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'pango')
makedepends=('git')
source=('git+https://github.com/acrisci/nagbar.git')
sha1sums=('SKIP')

_gitname='nagbar'

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  make clean
}
