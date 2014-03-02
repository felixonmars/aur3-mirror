# Contributor: Based on mfc9840 package by Gero Mueller <gero.mueller (at) cloo (dot) de>. Modified for dcp7055W by fala

pkgname=brother-dcp7055w-cupswrapper
_printer=dcp7055w
pkgver=3.0.1_1
pkgrel=1
pkgdesc="LPR-to-CUPS wrapper for Brother dcp7055W multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#DCP-7055W"
license=('custom:Brother_Software_Open')
depends=('cups' 'ghostscript' 'brother-dcp7055w-lpr>=3.0.1_1')
makedepends=('binutils')
provides=("$pkgname=${pkgver%_*}")
conflicts=("$pkgname")
replaces=("$pkgname")

source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}cupswrapper-${pkgver/_/-}.i386.deb")
md5sums=('3982c0ff510997d13e326c9f7324159d')
build() {
  cd $srcdir

  # extract the archive
  ar x ${_printer}cupswrapper-${pkgver//_/-}.i386.deb || return 1
  mkdir -p data/usr/lib/cups/filter
  tar -xzvf data.tar.gz -C data || return 1
  # correct the directory structure
  mv data/opt/brother data/usr/share/brother
  sed -i 's|/opt/brother|/usr/share/brother|g' `grep -lr '/opt/brother' data/` || return 1

  cp data/usr/share/brother/Printers/DCP7055W/cupswrapper/brother_lpdwrapper_DCP7055W  data/usr/lib/cups/filter
  mkdir -p data/usr/share/cups/model
  cp data/usr/share/brother/Printers/DCP7055W/cupswrapper/brother-DCP-7055W-cups-en.ppd  data/usr/share/cups/model

  # copy into place
  cp -r data/usr $pkgdir || return 1
}

# vim:set ts=2 sw=2 et:
