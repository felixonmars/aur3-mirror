# Maintainer: Mael Kerbiriou <mael.kerbiriouATfreeDOTfr>

pkgname=velox-wl-git
pkgver=r389.e10dc9d
pkgrel=1
pkgdesc='A simple tiling manager for Wayland'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/michaelforney/velox'
depends=('libevdev' 'wld-git' 'dmenu-wl-git' 'systemd' 'xcb-util-wm' 'libxkbcommon' 'libinput' 'swc-git')
makedepends=('git')
provides=('velox')
conflicts=()
source=('git+https://github.com/michaelforney/velox.git')
md5sums=('SKIP')

_gitname="velox"

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  make
  
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 "velox.conf.sample" "${pkgdir}/etc/velox.conf"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}

# vim: set noet ff=unix:
