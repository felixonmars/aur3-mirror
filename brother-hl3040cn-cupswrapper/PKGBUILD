# Maintainer: Kirt Lillywhite <kirt.lillywhite (at) gmail (dot) com>
pkgname=brother-hl3040cn-cupswrapper
_printer=hl3040cn
pkgver=1.1.2_1
pkgrel=1
pkgdesc="LPR-to-CUPS wrapper for Brother HL-3040CN multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL')
license=('Brother_Software_Open_License_Agreement')
optdepends=('cups: useless otherwise' 'brother-hl3040cn-lpr>=1.0.1_1: needed to print')
makedepends=('binutils')
provides=("$pkgname=${pkgver%_*}")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}cupswrapper-${pkgver/_/-}.i386.deb")
md5sums=('0899dc8d94759691b56756c1fe632b27')
install=brother-hl3040cn-cupswrapper.install
depends=('a2ps')

build() {
  cd $srcdir
  # Extract the archive
  ar x ${_printer}cupswrapper-${pkgver/_/-}.i386.deb || return 1
  mkdir data
  tar -xzvf data.tar.gz -C data || return 1
  sed -i 's|/etc/init.d|/etc/rc.d|' "data/opt/brother/Printers/${_printer}/cupswrapper/cupswrapper${_printer}" || return 1
  # copy into place
  cp -r data/opt $pkgdir || return 1
}
