 
pkgname=cnijfilter-common-mg5500series
pkgver=4.00
pkgrel=1
pkgrel=1
pkgdesc="Canon IJ Printer Driver (Common package)"
arch=('i686' 'x86_64')
url="http://support-sg.canon-asia.com/contents/SG/EN/0100467102.html"
license=('unknown')
depends=('libcups' 'popt')
makedepends=('rpmextract')
options=('emptydirs')
source=("http://gdlp01.c-wss.com/gds/5/0100005505/01/cnijfilter-mg5500series-4.00-1-rpm.tar.gz")
md5sums=('4abe4396e4efc7ff90f459ccf493bb9c')

build() {
if [ "${CARCH}" = 'x86_64' ]; then
rpmfile=$(find "$srcdir" -name cnijfilter-common-$pkgver*${CARCH}*.rpm)
elif [ "${CARCH}" = 'i686' ]; then
rpmfile=$(find "$srcdir" -name cnijfilter-common-$pkgver*i386*.rpm)
fi
cd $pkgdir
rpmextract.sh $rpmfile
}