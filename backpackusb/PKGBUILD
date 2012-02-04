# Contributor:  Rob Kennedy <archpackages@gmail.com>
pkgname=backpackusb
pkgver=1.1
pkgrel=2
pkgdesc="firmware and drivers for Backpack drives (such as CD Writers)"
url="http://www.micro-solutions.com"
license=""
depends=('fxload' 'udev' 'bash')
makedepends=('sed' 'bash')
conflicts=()
replaces=()
backup=()
install=(backpackusb.install)
source=(ftp://ftp.micro-solutions.com/software/backpack/linux/bpck-usb-firmware-1.1.tgz convert_usermap_backpackusb.sh)
md5sums=('5fb2d889139ecd09ffce35f81c1c8816' '60cbb7df6fb58886924a4ce7ac5172b8')

build() {
  cd $startdir/src/bpck-usb-firmware-$pkgver
  $startdir/src/convert_usermap_backpackusb.sh ./usb.usermap
  install -D -m644 backpackusb.rules $startdir/pkg/etc/udev/rules.d/backpackusb.rules
  sed -i 's|usb/bpckusb.fw|/lib/firmware/backpackusb.d|g' bpckusb
  install -D -m744 bpckusb $startdir/pkg/lib/udev/backpackusb.sh
  install -d -m755 $startdir/pkg/lib/firmware/backpackusb.d
  install -D -m644 firmware/* $startdir/pkg/lib/firmware/backpackusb.d
  install -D -m644 README $startdir/pkg/usr/share/licenses/backpackusb/COPYING
}
