# Contributor: Based on mfc9840 package by Corey Thompson <cmtptr (at) gmail (dot) com>. Modified for dcp7055W by fala

pkgname=brother-dcp7055w-lpr
_printer=dcp7055w
pkgver=3.0.1_1
pkgrel=2
pkgdesc="LPR driver for Brother dcp7055W multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#DCP-7055W"
license=('custom:Brother_Software_Open')
depends=('sh' 'a2ps')
makedepends=('binutils')
optdepends=("brother-$_printer-cupswrapper: For printing via CUPS.")
provides=("$pkgname=${pkgver%_*}")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}lpr-${pkgver/_/-}.i386.deb")
md5sums=('eca6a2a8f1743c9734cad84fe8e31756')
build() {
  cd $srcdir

  # extract the archive
  ar x ${_printer}lpr-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xzvf data.tar.gz -C data || return 1

  # correct the directory structure
  mv data/opt/brother data/usr/share/brother
  sed -i 's|/opt/brother|/usr/share/brother|g' `grep -lr '/opt/brother' data/` || return 1

  # copy into place
  cp -r data/usr $pkgdir || return 1

}

# vim:set ts=2 sw=2 et:
