# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=libbluetooth3
pkgver=4.101
pkgrel=4.1
pkgdesc="Library to use the BlueZ Linux Bluetooth stack"
arch=(i686 x86_64)
license=(GPL)
depends=("glibc>=2.15")
url=(https://packages.debian.org/sid/libbluetooth3)


if [[ $CARCH == i686 ]]; then
  _debarch=i386
  sha256sums=(7f9e09444d3bd93b44f1f873dfdfdfdfd5191d24c777f0b68efb9871dc2958ea)
else
  _debarch=amd64
  sha256sums=(1cd7b393fae5b3eae9e1f17ea24d6b3f39bffc118836c2c19ddc74730685ed91)
fi

source=(http://ftp.debian.org/debian/pool/main/b/bluez/${pkgname}_${pkgver}-${pkgrel}_${_debarch}.deb)

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 et:
