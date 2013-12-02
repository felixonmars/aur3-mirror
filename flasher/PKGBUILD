# Maintainer: Fernando Munoz
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

# The file needed can be downloaded from
# http://tablets-dev.nokia.com/maemo-dev-env-downloads.php

pkgname=flasher
pkgver=3.5_2.5.2.2
pkgrel=3
pkgdesc="Flasher utility for the Nokia N8X0 & N900"
arch=('i686' 'x86_64')
url="http://tablets-dev.nokia.com/maemo-dev-env-downloads.php"
license=('Custom')
if [ $CARCH == "i686" ]; then   depends=('libusb-compat'); fi
if [ $CARCH == "x86_64" ]; then depends=('lib32-libusb-compat'); fi
source=(http://skeiron.org/tablets-dev/maemo_dev_env_downloads/maemo_flasher-3.5_2.5.2.2.tar.gz)
md5sums=('0daa9898360f83bcb10db73775e70785')

package() {
  cd "$srcdir/maemo_flasher-$pkgver"

  install -m755 -d $pkgdir/usr/{bin,share/man/man1,share/doc/flasher}
  install -m755 flasher-3.5 $pkgdir/usr/bin/flasher-3.5
  install -m644 man/man1/flasher-3.5.1 $pkgdir/usr/share/man/man1/flasher-3.5.1
  cp doc/* $pkgdir/usr/share/doc/flasher

}

# vim:set ts=2 sw=2 et:
