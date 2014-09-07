# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=simpfand-go
pkgver=1.2
pkgrel=1
pkgdesc="A simple fan control daemon for ThinkPads (go port)"
arch=('x86_64')
url="http://github.com/hspak/simpfand-go"
license=('MIT')
depends=()
makedepends=('git' 'go')
conflicts=('simpfand')
provides=('simpfand')
source=("https://github.com/hspak/${pkgname}/archive/${pkgver}.tar.gz")
install=simpfand-git.install
md5sums=(2e24c5020cc28a2adc38045b16166f37)

build() {
  cd "$pkgname-$pkgver"

  go build -ldflags "-X main.VERSION $pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "simpfand.systemd" "${pkgdir}/usr/lib/systemd/system/simpfand.service"
  install -Dm755 "restart-simpfand.sh" "${pkgdir}/usr/lib/systemd/system-sleep/restart-simpfand.sh"

  # license
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
