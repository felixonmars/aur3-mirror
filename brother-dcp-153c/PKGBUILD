# Sabaku
pkgname=brother-dcp-153c
_printername=${pkgname/*-/}
pkgver=1.0.1
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-153C printer for i386 and x86_64"
arch=(any)
license=('custom:Brother Industries')
depends=('cups' 'tcsh')
makedepends=('rpmextract')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
source=(http://pub.brother.com/pub/com/bsc/linux/dlf/dcp153ccupswrapper-1.0.1-1.i386.rpm
		http://pub.brother.com/pub/com/bsc/linux/dlf/dcp153clpr-1.0.1-1.i386.rpm)
md5sums=('e7b640d46b33b7334ee9deb2e9c42c49'
         'b359371639bacec98a9d5f3465e4b1a3')

install=brotherdcp153c.install
build() {
  cd "$startdir/pkg" || return 1
  for n in $startdir/src/*.rpm; do
    rpmextract.sh "$n" || return 1
  done 

  sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/usr/local/Brother/Printer/dcp153c/cupswrapper/cupswrapperdcp153c
}
