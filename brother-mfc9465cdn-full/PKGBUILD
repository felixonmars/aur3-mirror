# Contributor: Nikolay Bogoychev <nheart@gmail.com>
# Maintainer: Nikolay Bogoychev <nheart@gmail.com>

pkgname=brother-mfc9465cdn-full
pkgver=1.1.1
pkgrel=5
pkgdesc='CUPS driver for Brother laser printer MFC-9465CDN, lpr + wrapper'
arch=('any')
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-9465CDN'
license=('Custom')
depends=('cups')
makedepends=('rpmextract' 'findutils' 'sed')
source=("http://www.brother.com/pub/bsc/linux/dlf/mfc9465cdncupswrapper-${pkgver}-${pkgrel}.i386.rpm" "http://www.brother.com/pub/bsc/linux/dlf/mfc9465cdnlpr-${pkgver}-${pkgrel}.i386.rpm" build.patch)
md5sums=("8e2a430cbd60c9ec89ab8556902756d4" "705ce0a4297449b98d90a1821d573a11" "353850d1b587d9c2bb479e8f2c21ce76")

build() {
    cd "$srcdir"
    rpmextract.sh *wrapper*
    rpmextract.sh *lpr*
    mkdir -p usr/share/ppd
    mkdir -p usr/lib/cups/filter
    patch -p0 < build.patch
    ./usr/local/Brother/Printer/mfc9465cdn/cupswrapper/cupswrappermfc9465cdn
}

package() {
    cp -a $srcdir/usr $pkgdir/
}
