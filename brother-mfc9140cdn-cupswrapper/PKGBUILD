# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=brother-mfc9140cdn-cupswrapper
_printer=mfc9140cdn
pkgver=1.1.2_1
pkgrel=1
pkgdesc="LPR-to-CUPS wrapper for Brother MFC-9140CDN multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public/eu/eu_ot/en/dlf/download_index.html?c=eu_ot&lang=en&prod=mfc9140cdn_eu_as_cn&os=128&type2=-1"
license=('custom:Brother_Software_Open_License')
depends=('cups' 'ghostscript' 'brother-mfc9140cdn-lpr>=1.1.1_5')
makedepends=('binutils')
provides=("$pkgname=${pkgver%_*}")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}cupswrapper-${pkgver/_/-}.i386.deb"
        'license.txt')
md5sums=('deeebb610f70d5d04e2c2580ea7e25c0'
         'a476e6b6f379aba9467780d5d9b24269')

package() {
  cd $srcdir

  # extract the archive
  ar x ${_printer}cupswrapper-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xzvf data.tar.gz -C data || return 1

  # correct the directory structure
  mkdir -p data/usr/share
  mv data/opt/brother data/usr/share/brother
  rm -r data/opt
  sed -i 's|/opt/brother|/usr/share/brother|g' `grep -lr '/opt/brother' data/` || return 1
  sed -i 's|/etc/init.d|/etc/rc.d|' "data/usr/share/brother/Printers/${_printer}/cupswrapper/cupswrapper${_printer}" || return 1

  # copy into place
  cp -r data/usr $pkgdir || return 1

  # install the license
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
}
