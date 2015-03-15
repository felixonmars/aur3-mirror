# Maintainer: Luke Granger-Brown <archlinux@lukegb.com>
pkgname=x509ls-git
pkgver=r20.9a547c3
pkgrel=1
pkgdesc="A text-based SSL certificate viewer."
arch=('i686' 'x86_64')
url="https://github.com/skip2/x509ls"
license=('MIT')
groups=()
depends=('openssl' 'ncurses')
makedepends=('git' 'cmake>=2.6' 'python')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('x509ls::git+https://github.com/skip2/x509ls.git')
noextract=()
md5sums=('SKIP')

_gitname=x509ls

build() {
  [ -e "$srcdir/$_gitname-build" ] && rm -r "$srcdir/$_gitname-build"
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Release mode is broken
  cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
