# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=libbluetooth3-dbg
pkgver=4.101
pkgrel=4.1
pkgdesc="Library to use the BlueZ Linux Bluetooth stack with debugging symbols"
arch=(i686 x86_64)
license=(GPL)
depends=("libbluetooth3=4.101")
url=(https://packages.debian.org/sid/${pkgname})


if [[ $CARCH == i686 ]]; then
  _debarch=i386
  sha256sums=(9f91b885d4ac8b8592a4d8f7c87ff5416a3b8b958396699ee3305e0e794f4888)
else
  _debarch=amd64
  sha256sums=(21216fdbd56bfa8a56d560f756f1893e7f0c8d9340a9158f027f901caa25134c)
fi

source=(http://ftp.us.debian.org/debian/pool/main/b/bluez/${pkgname}_${pkgver}-${pkgrel}_${_debarch}.deb)

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 et:
