# Maintainer: firstvirus92 <firstvirus92 at gmail dot com>

pkgname=toxic-groupbot-git
pkgver=0.0.0.3
pkgrel=1
pkgdesc="A bot for tox that can automatically invite people to group chats (git version)"
arch=("i686" "x86_64")
url="http://tox.im"
license=("GPL3")
depends=("tox-git" "ncurses")
makedepends=("git")
provides=("toxic-groupbot")
conflicts=("toxic-groupbot" "toxic")
install=toxic-groupbot-git.install
source=("$pkgname::git+https://github.com/JFreegman/toxic.git#branch=groupbot")
sha512sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/build"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname/build"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}