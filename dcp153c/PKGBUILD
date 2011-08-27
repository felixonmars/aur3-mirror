pkgname=dcp153c
_printername=${pkgname/*-/}
pkgver=1.0.1
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-153C printer"
arch=(i686)
license=('custom:Brother Industries')
depends=('cups' 'tcsh')
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/cups_wrapper/${_printername}cupswrapper-$pkgver-$pkgrel.i386.rpm \
	http://solutions.brother.com/Library/sol/printer/linux/rpmfiles/lpr_others/${_printername}lpr-$pkgver-$pkgrel.i386.rpm)
md5sums=('e7b640d46b33b7334ee9deb2e9c42c49'
	 'b359371639bacec98a9d5f3465e4b1a3')
install=dcp153c.install
build() {
  cd "$startdir/pkg" || return 1
  for n in $startdir/src/*.rpm; do
    rpmextract.sh "$n" || return 1
  done 

  sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/usr/local/Brother/Printer/dcp153c/cupswrapper/cupswrapperdcp153c

}
