# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=maynard
pkgname=$_pkgname-git
pkgver=r113.a3ece65
pkgrel=1
pkgdesc="Desktop environment for Wayland"
arch=('i686' 'x86_64')
url="https://github.com/raspberrypi/maynard/wiki/"
license=('GPLv2+')
depends=("wayland" "weston" "gtk3" "gnome-menus" "gnome-desktop" "alsa-lib" "gsettings-desktop-schemas")
makedepends=('intltool')
install=maynard.install
provides=("maynard")
conflicts=("maynard")
source=("git+https://github.com/raspberrypi/maynard.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

