# Maintainer: Hunter Jones <hjones2199 at gmail dot com>
pkgname=lightdm-webkit2-greeter-git
pkgver=0.1
pkgrel=1
pkgdesc="Webkit2 greeter for LightDM"
arch=('i686' 'x86_64')
url="https://github.com/Antergos/lightdm-webkit2-greeter"
license=('GPL3' 'LGPL3')
depends=('lightdm' 'webkit2gtk')
makedepends=('git' 'gnome-common' 'intltool')
provides=("${pkgname%-*}" "lightdm-webkit-greeter")
conflicts=("${pkgname%-*}")
backup=("etc/lightdm/${pkgname%-*}.conf")
source=("${pkgname%-*}::git+https://github.com/Antergos/lightdm-webkit2-greeter.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/${pkgname%-*}

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/lightdm
  make
}

package() {
  cd "${srcdir}"/${pkgname%-*}

  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/etc/lightdm
}

# vim: ts=2 sw=2 et:

