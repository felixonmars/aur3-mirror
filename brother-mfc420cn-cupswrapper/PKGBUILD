# Contributor: Corey Thompson <cmtptr (at) gmail (dot) com>
pkgname=brother-mfc420cn-cupswrapper
_printer=MFC420CN  # note: Should be changed to lowercase if used.
                   #       Currently uppercase to match .deb filename
pkgver=1.0.2_3
pkgrel=2
pkgdesc="LPR-to-CUPS wrapper for Brother MFC-420CN multifunction network printer"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/download_prn.html#MFC-420CN"
license=('custom:Brother_Software_Open_License_Agreement')
depends=('cups' 'ghostscript' 'brother-mfc420cn-lpr>=1.0.2_1')
makedepends=('binutils')
provides=("$pkgname=${pkgver%_*}")
conflicts=("$pkgname")
replaces=("$pkgname")
install="$pkgname.install"
source=('http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/cups_wrapper/cupswrapperMFC420CN-1.0.2-3.i386.deb'
        'license.txt')
md5sums=('4b8b20de3e7e8970aeac74934651a577'
         'e6c88b61e90bc1535269f402a01d5321')

build() {
  cd $srcdir

  # extract the archive
  ar x cupswrapper${_printer}-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xzvf data.tar.gz -C data || return 1

  # correct the directory structure
  mv data/usr/local/Brother data/usr/share/brother
  rm -r data/usr/local
  sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' data/` || return 1
  sed -i 's|/etc/init.d|/etc/rc.d|' "data/usr/share/brother/cupswrapper/cupswrapperMFC420CN-1.0.2" || return 1

  # copy into place
  cp -r data/usr $pkgdir || return 1

  # install the license
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt || return 1
}

# vim:set ts=2 sw=2 et:
