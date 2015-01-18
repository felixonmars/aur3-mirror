# Maintainer: Florian Bäuerle <florian.bae@gmail.com>

_pkgname=gnome-battery-bench
pkgname=$_pkgname-git
pkgver=32.9915faf
pkgrel=2
pkgdesc="Measure power usage in defined scenarios (git version)"
arch=('i686' 'x86_64')
url="https://git.gnome.org/browse/gnome-battery-bench/"
license=(GPL)
makedepends=(asciidoc gnome-common xmlto)
depends=(gtk3 dconf)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=('git+git://git.gnome.org/gnome-battery-bench')
sha256sums=('SKIP')

build() {
  cd "$srcdir"/$_pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib --libexecdir=/usr/lib/$_pkgname
  make
}

package() {
  cd "$srcdir"/$_pkgname
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd "$srcdir"/$_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
