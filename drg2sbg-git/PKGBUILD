# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=drg2sbg-git
_gitname="drg2sbg"
pkgver=2.2.1.g1661
pkgrel=1
pkgdesc="a tool to convert .drg files (I-Doser) to .sbg (SBaGen)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/drg2sbg/"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('drg2sbg')
conflicts=('drg2sbg')
source=('git+https://code.google.com/p/drg2sbg/')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  ./GIT-VERSION-GEN
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

# vim:set ts=2 sw=2 et:
