# Contributor: Based on mfc9840 package by Corey Thompson <cmtptr (at) gmail (dot) com>. Modified for mfc9970 by Bregol
pkgname=brother-mfc9970cdw-lpr
_printer=mfc9970cdw
pkgver=1.1.1_5
pkgrel=3
pkgdesc="LPR driver for Brother MFC-9970CDW multifunction network printer"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/download_prn.html#MFC-9970CDW"
license=('custom:Brother_Software_Open_License')
depends=('sh' 'a2ps')
makedepends=('binutils')
optdepends=("brother-$_printer-cupswrapper: For printing via CUPS.")
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}lpr-${pkgver/_/-}.i386.deb"
        'license.txt')
md5sums=('9ba8b458aa5d784a18f138c4dbb61576'
        'e6c88b61e90bc1535269f402a01d5321')
build() {
  cd $srcdir

  # extract the archive
  ar x ${_printer}lpr-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xzvf data.tar.gz -C data || return 1

  # correct the directory structure
  mv data/usr/local/Brother data/usr/local/brother
  mv data/usr/local data/usr/share
  sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' data/` || return 1

  # copy into place
  cp -r data/usr $pkgdir || return 1

  # install the license
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}

# vim:set ts=2 sw=2 et:
