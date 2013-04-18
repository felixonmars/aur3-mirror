pkgname=dcp150c
_printername=${pkgname/*-/}
pkgver=1.0.1
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-150C printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'tcsh')
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://pub.brother.com/pub/com/bsc/linux/dlf/${_printername}cupswrapper-$pkgver-$pkgrel.i386.rpm http://pub.brother.com/pub/com/bsc/linux/dlf/${_printername}lpr-$pkgver-$pkgrel.i386.rpm)

md5sums=('0b0b0e740cb2c30d8709ac564efedf3a'
	 'f2b4c293af050f76d47f0c480d166bc3')
install=dcp150c.install
build() {
  cd "$pkgdir" || return 1
  for n in $startdir/src/*.rpm; do
    rpmextract.sh "$n" || return 1
  done 

  sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/usr/local/Brother/Printer/dcp150c/cupswrapper/cupswrapperdcp150c

}
