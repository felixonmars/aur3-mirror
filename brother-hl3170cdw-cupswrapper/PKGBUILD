# Maintainer: Evgeny Makarov <patriot-8891 (at) ya (dot) ru>
pkgname=brother-hl3170cdw-cupswrapper
_printer=hl3170cdw
pkgver=1.1.2_1
pkgrel=1
pkgdesc="LPR-to-CUPS wrapper for Brother HL-3040CN multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL')
license=('Brother_Software_Open_License_Agreement')
optdepends=('cups: useless otherwise' 'brother-hl3170cdw-lpr>=1.0.1_1: needed to print')
makedepends=('binutils')
provides=("$pkgname=${pkgver%_*}")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}cupswrapper-${pkgver/_/-}.i386.deb")
md5sums=('7b9cc05a00ac86a6825a3743e89903b2')
install=brother-hl3170cdw-cupswrapper.install
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
