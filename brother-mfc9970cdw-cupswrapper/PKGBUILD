# Contributor: Based on mfc9840 package by Gero Mueller <gero.mueller (at) cloo (dot) de>. Modified for mfc9970 by Bregol
pkgname=brother-mfc9970cdw-cupswrapper
_printer=mfc9970cdw  # note: Should be changed to lowercase if used.
                   #       Currently uppercase to match .deb filename
pkgver=1.1.1_5
pkgrel=2
pkgdesc="LPR-to-CUPS wrapper for Brother MFC-9970CDW multifunction network printer"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/download_prn.html#MFC-9970CDW"
license=('custom:Brother_Software_Open_License')
depends=('cups' 'ghostscript' 'brother-mfc9970cdw-lpr>=1.1.1_5')
makedepends=('binutils')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}cupswrapper-${pkgver/_/-}.i386.deb"
        'license.txt')
md5sums=('d7055ee37d152fa1aa98a2518694d159'
        'e6c88b61e90bc1535269f402a01d5321')
build() {
  cd $srcdir

  # extract the archive
  ar x ${_printer}cupswrapper-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xzvf data.tar.gz -C data || return 1

  # correct the directory structure
  mkdir -p data/usr/share
  mv data/usr/local/Brother data/usr/share/brother
  rm -r data/usr/local
  sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' data/` || return 1
  sed -i 's|/etc/init.d|/etc/rc.d|' "data/usr/share/brother/Printer/${_printer}/cupswrapper/cupswrapper${_printer}" || return 1

  # copy into place
  cp -r data/usr $pkgdir || return 1

  # install the license
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}

# vim:set ts=2 sw=2 et:
