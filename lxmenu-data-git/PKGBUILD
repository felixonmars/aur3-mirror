# Maintainer: firstvirus92 <firstvirus92 at gmail dot com>

pkgname=lxmenu-data-git
pkgver=0.0.0.1
pkgrel=1
pkgdesc="freedesktop.org application menu definition files"
arch=("i686" "x86_64")
url="http://lxde.org/"
license=("GPL2")
makedepends=("intltool")
provides=("lxmenu-data")
conflicts=("lxmenu-data")
source=("$pkgname::git://git.lxde.org/git/lxde/lxmenu-data.git")
sha512sums=("SKIP")

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
