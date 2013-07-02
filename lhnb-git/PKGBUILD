# Contributor: Patrick Burroughs <celticmadman@gmail.com>
# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=lhnb-git
_gitname="lhnb"
pkgver=39.4611bba
pkgrel=1
pkgdesc="liskin's hierarchical notebook (git version)"
arch=('i686' 'x86_64')
url="https://github.com/liskin/lhnb"
license=('GPL')
depends=('ncurses')
makedepends=('git')
provides=('hnb')
conflicts=('hnb')
source=("git+https://github.com/liskin/lhnb.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i 's|/usr/local/bin/|$(DESTDIR)/usr/bin/|g' Makefile
  sed -i 's|/usr/local/man/|$(DESTDIR)/usr/share/man/|g' Makefile
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
