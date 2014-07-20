# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=fom-git
pkgver=v0.8.14.g9a1fddf
pkgrel=1
pkgdesc="Pacman cache cleaner with set backup count"
arch=('any')
url="http://github.com/hspak/fom"
license=('MIT')
depends=()
makedepends=('git')
conflicts=()
provides=()
source=("git://github.com/hspak/fom")
md5sums=('SKIP')

pkgver() {
  cd 'fom'
  git describe | sed 's/-/./g'
}

package() {
  install -D -m755 "${srcdir}/fom/fom" "${pkgdir}/usr/bin/fom"

  install -D -m644 "${srcdir}/fom/fom.service" "${pkgdir}/usr/lib/systemd/system/fom.service"
  install -D -m644 "${srcdir}/fom/fom.timer" "${pkgdir}/usr/lib/systemd/system/fom.timer"

  # license
  install -D -m644 "${srcdir}/fom/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
