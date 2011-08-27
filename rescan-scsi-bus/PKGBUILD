pkgname=rescan-scsi-bus
pkgver=1.48
pkgrel=1
pkgdesc="Script for rescan SCSI bus, using the scsi add-single-device mechanism"
arch=('i686' 'x86_64')
url="http://www.garloff.de/kurt/linux/"
license=('GPL')
depends=()
source=(http://www.garloff.de/kurt/linux/rescan-scsi-bus.sh-$pkgver)
md5sums=('d59334ecd06b1c8a614514adb099507d')

build() {
  cd "$startdir"/src
  mkdir -p "$startdir"/pkg/usr/sbin
  install -m755 rescan-scsi-bus.sh-"$pkgver" "$startdir"/pkg/usr/sbin/rescan-scsi-bus.sh
}

