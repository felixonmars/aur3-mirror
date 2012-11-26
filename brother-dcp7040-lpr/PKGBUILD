# Contributor: Roland Singer <roland@manjaro.org>

pkgname=brother-dcp7040-lpr
pkgver=2.0.2_1
pkgrel=1
pkgdesc='LPR driver for Brother laser printer DCP-7040'
arch=('i686' 'x86_64')
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#DCP-7040'
license=('LGPL')
makedepends=('rpmextract')
source=("http://pub.brother.com/pub/com/bsc/linux/dlf/brdcp7040lpr-${pkgver/_/-}.i386.rpm")

build() {
    cd "$srcdir"
    rpmextract.sh "brdcp7040lpr-${pkgver/_/-}.i386.rpm"
}

package() {
    cd "$srcdir"
    find . -type f | while read file
    do
        local newfile="${pkgdir}/${file}"
        install -DT "$file" "$newfile"
    done

}
sha256sums=('013958c343c3aa336138bab87a8b1b9c7266e5c59715636e2025b63815c216ce')
