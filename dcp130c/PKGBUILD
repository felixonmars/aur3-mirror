pkgname=dcp130c
_printername=${pkgname/*-/}
pkgver=1.0.1
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-130C printer"
arch=(i686)
license=('custom:Brother Industries')
depends=('cups' 'tcsh')
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/cups_wrapper/${_printername}cupswrapper-$pkgver-$pkgrel.i386.rpm \
	http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/lpr_others/${_printername}lpr-$pkgver-$pkgrel.i386.rpm)
md5sums=('fefbc571a5d75673233ce3a65ae26e68'
	 '752d1cd03483cc2137f92b3481693bb0')
install=dcp130c.install
build() {
  cd "$startdir/pkg" || return 1
  for n in $startdir/src/*.rpm; do
    rpmextract.sh "$n" || return 1
  done 

  sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/usr/local/Brother/Printer/dcp130c/cupswrapper/cupswrapperdcp130c

}
