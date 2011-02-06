# Contributor: cdfk <cdfk1981-at-gmail.com>
# Contributor: grondinm marcfgrondin@gmail.com

pkgname=brother-mfc240c
_printername=${pkgname/*-/}
pkgver=1.0.1
pkgrel=1
pkgdesc="Cups driver for Brother MFC-240C printer"
arch=('i686' 'x86_64')
license=("GPL" 'custom:brother commercial license')
[ $CARCH == "x86_64" ] && depends=('cups' 'lib32-libcups')
[ $CARCH == "i686" ] && depends=('cups')
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(
	http://www.brother.com/pub/bsc/linux/dlf/mfc240clpr-1.0.1-1.i386.rpm
	http://www.brother.com/pub/bsc/linux/dlf/mfc240ccupswrapper-1.0.1-1.i386.rpm
)
md5sums=('e2564327cb7fc6501ca9657080855322'
         '207cf1eb6bbab8d2ecafd8a2b5bc8f4b')
install=${pkgname}.install
build() {
cd $srcdir
rpmextract.sh mfc240clpr-1.0.1-1.i386.rpm
rpmextract.sh mfc240ccupswrapper-1.0.1-1.i386.rpm
cd $srcdir/usr/local/Brother/Printer/mfc240c/cupswrapper/
sed 's/init.d/rc.d/g' cupswrappermfc240c > tmp && mv tmp cupswrappermfc240c
chmod 755 cupswrappermfc240c
cd $srcdir
cp -r $srcdir/usr/ $pkgdir
}
