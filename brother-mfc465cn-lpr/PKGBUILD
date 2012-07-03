# Maintainer: Brendon Rapp [ <legion (at) economyofeffort (dot) com>
pkgname=brother-mfc465cn-lpr
_printer=mfc465cn
pkgver=1.0.1_1
pkgrel=2
pkgdesc="LPR driver for Brother MFC-465CN multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('custom:Brother_Software_Open_License_Agreement')
depends=('sh')
makedepends=('binutils')
optdepends=("brother-$_printer-cupswrapper: For printing via CUPS.")
provides=("$pkgname=${pkgver%_*}")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}lpr-1.0.1-1.i386.deb")
md5sums=('70375a3ed93d28113847a582946d6c56')

build() {
  cd $srcdir
  ar x ${_printer}lpr-${pkgver/_/-}.i386.deb || return 1
  mkdir data
  tar -xzvf data.tar.gz -C data || return 1
  # Fix directory structure. Moves /usr/local/Brother to /usr/share/brother and fix links
  mv data/usr/local/Brother data/usr/local/brother
  mv data/usr/local data/usr/share
  sed -i 's|/usr/local/Brother|/usr/share/brother|g' $(grep -lr '/usr/local/Brother' data/) || return 1
  cp -r data/usr $pkgdir || return 1
}
