# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=libbluetooth-dev
pkgver=4.101
pkgrel=4.1
pkgdesc="Development files for using the BlueZ Linux Bluetooth library"
arch=(i686 x86_64)
license=(GPL)
depends=("libbluetooth3=4.101")
optdepends=('pkg-config: manage compile and link flags for libraries')
url=(https://packages.debian.org/sid/libbluetooth-dev)


if [[ $CARCH == i686 ]]; then
  _debarch=i386
  sha256sums=(edad34e2140446b1e4d6f3b8283ddff6295933bade56726eb28a3239038d14c3)
else
  _debarch=amd64
  sha256sums=(a1b59f667005e28f09e861fdcf5aa0f986211d60c9272aecb1f7b789be34c5e6)
fi

source=(http://ftp.us.debian.org/debian/pool/main/b/bluez/${pkgname}_${pkgver}-${pkgrel}_${_debarch}.deb)

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 et:
