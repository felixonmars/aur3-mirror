# Maintainer: Daniele Paolella <dp@hostess-promoter.com>
pkgname=brother-mfc8520dn
pkgver="3.0.0"
pkgrel=1
pkgdesc="LPR and CUPSwrapper printer driver for Brother MFC-8520DN"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('custom:Brother'
         'GPL2')
depends=('cups')
makedepends=('rpmextract')
source=(http://www.brother.com/pub/bsc/linux/dlf/mfc8520dnlpr-$pkgver-1.i386.rpm
        http://www.brother.com/pub/bsc/linux/dlf/mfc8520dncupswrapper-$pkgver-1.i386.rpm)
noextract=(mfc8520dnlpr-$pkgver-1.i386.rpm
           mfc8520dncupswrapper-$pkgver-1.i386.rpm)
md5sums=('774ea809ae913b0c5f44a8b146a830a2'
         'e098fb6516de786983ad2e16d9123130')

if [ $CARCH == 'x86_64' ]; then
	depends+=('lib32-glibc') 
fi

package() {
	cd "$pkgdir"
	rpmextract.sh "$srcdir/mfc8520dnlpr-$pkgver-1.i386.rpm"
	rpmextract.sh "$srcdir/mfc8520dncupswrapper-$pkgver-1.i386.rpm"
}
