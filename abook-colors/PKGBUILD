# Maintainer: Luc Chabassier <luc dot linux at mailoo dot org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Peter Lewis <plewis at aur dot archlinux dot org>
# Contributor: damir <damir at archlinux dot org>
# Contributor: Thayer Williams <thayer at archlinux dot org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux dot us>
# Contributor: Gaetan Bisson <bisson at archlinux dot org>
# Contributor: Fabio Zanini <fabio dot zanini at fastmail dot fm>

pkgname=abook-colors
_pkgname=abook_colors_patch
pkgver=r349.c041634
pkgrel=1
pkgdesc='abook-muttgroups clone with line_color and change_color patches.'
arch=('i686' 'x86_64')
url='https://github.com/lucas8/abook_colors_patch'
license=('GPL2')
depends=('readline')
makedepends=('git' 'automake-1.12')
provides=('abook')
conflicts=('abook' 'abook-vcard' 'abook-muttgroups')
source=('git+https://github.com/lucas8/abook_colors_patch.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

