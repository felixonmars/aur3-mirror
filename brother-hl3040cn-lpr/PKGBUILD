# Maintainer: Kirt Lillywhite <kirt.lillywhite (at) gmail (dot) com>
pkgname=brother-hl3040cn-lpr
_printer=hl3040cn
pkgver=1.1.2_1
pkgrel=1
pkgdesc="LPR driver for Brother HL-3040CN multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('Brother_Software_Open_License_Agreement')
depends=('sh')
makedepends=('binutils')
optdepends=("brother-$_printer-cupswrapper: For printing via CUPS.")
provides=("$pkgname=${pkgver%_*}")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}lpr-${pkgver/_/-}.i386.deb")
md5sums=('ea5f589085fe7c99e655b9088f5933e5')
install='brother-hl3040cn-lpr.install'

build() {
  cd $srcdir
  ar x ${_printer}lpr-${pkgver/_/-}.i386.deb || return 1
  mkdir data
  tar -xzvf data.tar.gz -C data || return 1
  cp -r data/opt $pkgdir || return 1
}
