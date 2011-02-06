# Contributor: ZeroCool <trash4you(at)online(dot).de>
pkgname=dcp110c
_printername=DCP110C
_sourcebase="http://pub.brother.com/pub/com/bsc/linux/dlf/"
pkgver=1.0.2
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-110C printer"
arch=('i686', 'x86_64')
license=('custom:Brother Industries')
if [ "$CARCH" = "x86_64" ]; then
    depends=('cups' 'sed' 'tcsh' 'lib32-libcups' 'ghostscript' 'gsfonts' 'foomatic-filters')
else
    depends=('cups' 'sed' 'tcsh' 'ghostscript' 'gsfonts' 'foomatic-filters')
fi
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=("${_sourcebase}cupswrapper${_printername}-1.0.0-$pkgrel.i386.rpm"
        "${_sourcebase}${_printername}lpr-$pkgver-$pkgrel.i386.rpm")
md5sums=('f3b7e05232838ac2eaa008f0a6d74c4f'
         '5b51032a121f9c2e8cd2271c517e5eb7')
install=${pkgname}.install
build() {
  cd "$startdir/pkg" || return 1
  
  for n in $startdir/src/*.rpm; do
    rpmextract.sh "$n" || return 1
  done 

  sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/usr/local/Brother/cupswrapper/cupswrapperDCP110C-1.0.0
}
