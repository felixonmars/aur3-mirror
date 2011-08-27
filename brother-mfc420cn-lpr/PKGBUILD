# Contributor: Corey Thompson <cmtptr (at) gmail (dot) com>
pkgname=brother-mfc420cn-lpr
_printer=mfc420cn
pkgver=1.0.2_1
pkgrel=2
pkgdesc="LPR driver for Brother MFC-420CN multifunction network printer"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/download_prn.html#MFC-420CN"
license=('custom:Brother_Software_Open_License_Agreement')
depends=('tcsh')
makedepends=('binutils')
optdepends=("brother-$_printer-cupswrapper: For printing via CUPS.")
provides=("$pkgname=${pkgver%_*}")
conflicts=("$pkgname")
replaces=("$pkgname")
source=('http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/lpr_debian/mfc420cnlpr-1.0.2-1.i386.deb'
        'license.txt')
md5sums=('6b1f9827cb72dee4aebb572b5909e1d4'
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
