# Maintainer: David Dufberg Tøttrup <david at dufberg dot se>

pkgname=mmkeyosd-git
_gitname="mmkeyosd"
pkgver=47.a53e92a
pkgrel=2
pkgdesc="Use multimedia keys to change stuff and display an OSD"
arch=('i686' 'x86_64')
url="https://github.com/dapus/mmkeyosd"
license=('MIT')
depends=('libxft' 'libx11')
makedepends=('git' 'libxft' 'libx11')
optdepends=('xcompmgr: for transparency')
conflicts=('mmkeyosd')
provides=('mmkeyosd')
install="mmkeyosd-git.install"
source=('git://github.com/dapus/mmkeyosd')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/doc/mmkeyosd"
  install -m644 "keys.example" "$pkgdir/usr/share/doc/mmkeyosd/keys"
  install -m644 "settings.example" "$pkgdir/usr/share/doc/mmkeyosd/settings"
  install -m644 "brightness.sh" "$pkgdir/usr/share/doc/mmkeyosd"
}

# vim:set ts=2 sw=2 et:
