pkgname=dcp165c
_printername=${pkgname/*-/}
pkgver=1.1.2
pkgrel=2
pkgdesc="CUPS driver for Brother DCP-165 printer"
arch=('any')
license=('custom:Brother Industries')
depends=('cups' 'tcsh')
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://www.brother.com/pub/bsc/linux/dlf/dcp165ccupswrapper-1.1.2-2.i386.rpm http://www.brother.com/pub/bsc/linux/dlf/dcp165clpr-1.1.2-2.i386.rpm)
md5sums=('0bf765de513b8d1e37567ecf2c04897e' '22a0932c6547a682af4a16fb86100614' )
#install=dcp165c.install
build() {
  cd "$startdir/pkg" || return 1
  for n in $startdir/src/*.rpm; do
    rpmextract.sh "$n" || return 1
  done

  sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/usr/local/Brother/Printer/dcp165c/cupswrapper/cupswrapperdcp165c

}

