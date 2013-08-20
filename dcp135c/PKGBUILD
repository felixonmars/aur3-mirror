# Contributor: Jan Hrdina <jan.hrdka@gmail.com>

pkgname=dcp135c
_printername=${pkgname/*-/}
pkgver=1.0.1
pkgrel=4
pkgdesc="CUPS driver for Brother DCP-135C printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'tcsh')
if test "$CARCH" == x86_64; then
  depends+=('lib32-libcups')
fi
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://www.brother.com/pub/bsc/linux/dlf/${_printername}cupswrapper-$pkgver-1.i386.rpm \
	http://www.brother.com/pub/bsc/linux/dlf/${_printername}lpr-$pkgver-1.i386.rpm)
md5sums=('82477f63f298bca32374450de6393270'
	 '395026a5438b03be521d309f38b4132b')
install=dcp135c.install

build() {
   cd "$pkgdir" || return 1
   for n in $srcdir/*.rpm; do
   rpmextract.sh "$n" || return 1
   done 

   sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/usr/local/Brother/Printer/dcp135c/cupswrapper/cupswrapperdcp135c

}

