# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="madfuload"
pkgver="1.2"
pkgrel="7"
pkgdesc="USB and MIDI firmware loaders for M-Audio (or Midiman) hardware."
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/usb-midi-fw"
license=("GPL")
source=(
  "http://downloads.sourceforge.net/usb-midi-fw/madfuload-$pkgver.tar.gz"
  "use-udevadm-in-configure.patch"
  "fix-segfaults-with-logger.patch"
  "42-madfuload.rules"
)
sha1sums=(
  "a57895b0611f221a4df70f91d4578f36a0639619"
  "95cd4ac60704f35afe0fa8dc3123af469593b3dd"
  "37b897a95d16130fb30bfdb97cc41d866675f035"
  "b8909bc7fa32e6176fea63e0aa99f3f2b6980e55"
)


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p0 < "$srcdir/use-udevadm-in-configure.patch"
  patch -p1 < "$srcdir/fix-segfaults-with-logger.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-udev=/etc/udev
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm 644 "$srcdir/42-madfuload.rules" "$pkgdir/etc/udev/rules.d/42-madfuload.rules"
}
