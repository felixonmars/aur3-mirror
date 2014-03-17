pkgname=dcp185c
_printername=${pkgname/*-/}
pkgver=1.1.2
pkgrel=2
pkgdesc="CUPS driver for Brother DCP-185C printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'tcsh' 'ghostscript' 'gsfonts' 'foomatic-filters')
case ${CARCH} in
     i686 )
           depends=(${depends} 'libcups')
           ;;
     x86_64 )
           depends=(${depends} 'lib32-libcups')
           ;;
esac
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://pub.brother.com/pub/com/bsc/linux/dlf/${_printername}cupswrapper-$pkgver-$pkgrel.i386.rpm http://pub.brother.com/pub/com/bsc/linux/dlf/${_printername}lpr-$pkgver-$pkgrel.i386.rpm)

md5sums=('562edb38a1f167e3952fc02ae81f6ef8'
	 '8ec7fb443d8dfe3af3d2a40bde161a95')
install=dcp185c.install
build() {
  cd "$pkgdir" || return 1
  for n in $startdir/src/*.rpm; do
    rpmextract.sh "$n" || return 1
  done 

  sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/usr/local/Brother/Printer/dcp185c/cupswrapper/cupswrapperdcp185c

}
