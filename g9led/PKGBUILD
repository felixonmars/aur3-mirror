# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=g9led
pkgver=1.0
pkgrel=2
pkgdesc="Logitech G9 LED color control utility"
arch=('i686' 'x86_64')
url="http://als.regnet.cz/logitech-g9-linux-led-color.html"
license=('unknown')
depends=('libusb')
makedepends=('gcc')
install="${pkgname}.install"
source=(http://als.regnet.cz/data/${pkgname}.c
        ${pkgname}d
        ${pkgname}d.service)
noextract=('g9led.c')
md5sums=('d9314aa488e606563e5cd773e7050c93'
         '0ab71f79161091cf2394e3ef723cbf79'
         '14d8f5239926d756eb761e566523c003')

build() {
  # Build
  gcc g9led.c -o g9led -lusb
  # Install program, daemon, systemd init file
  install -Dm755 g9led          $pkgdir/usr/bin/${pkgname}
  install -Dm755 g9ledd         $pkgdir/usr/bin/${pkgname}d
  install -Dm644 g9ledd.service $pkgdir/etc/systemd/system/${pkgname}d.service
}