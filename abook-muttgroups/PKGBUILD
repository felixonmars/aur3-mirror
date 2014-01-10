# Maintainer: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Peter Lewis <plewis at aur dot archlinux dot org>
# Contributor: damir <damir at archlinux dot org>
# Contributor: Thayer Williams <thayer at archlinux dot org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux dot us>
# Contributor: Gaetan Bisson <bisson at archlinux dot org>
# Contributor: Fabio Zanini <fabio dot zanini at fastmail dot fm>

pkgname=abook-muttgroups
_pkgname=abook
pkgver=r344.51847f5
pkgrel=1
pkgdesc='abook clone with vcard, mutt groups, merge, delete duplicates, mouse and color support'
arch=('i686' 'x86_64')
url='https://gitorious.org/abook/abook'
license=('GPL2')
depends=('readline')
makedepends=('git' 'automake-1.12')
provides=('abook')
conflicts=('abook' 'abook-vcard')
source=('git+https://git.gitorious.org/abook/abook.git')
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
