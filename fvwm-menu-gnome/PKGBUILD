# Maintainer: Denis Sheremet <zaycakitayca@xaker.ru>
pkgname=fvwm-menu-gnome
pkgver=r5.13a0047
pkgrel=1
pkgdesc="Fast and simple fvwm-menu-desktop replacement, written on c++"
url="https://github.com/zaycakitayca/fvwm-menu-gnome"
arch=('x86_64' 'i686')
license=('custom:WTFPL')
depends=('gnome-menus' 'glib2')
optdepends=()
makedepends=('git')
conflicts=()
replaces=()
backup=()
source=("${pkgname}::git+https://github.com/zaycakitayca/${pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}





