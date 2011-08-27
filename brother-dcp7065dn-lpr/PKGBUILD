pkgname=brother-dcp7065dn-lpr
pkgver=2.1.0_1
pkgrel=1
pkgdesc='LPR driver for Brother laser printer DCP-7065DN'
arch=('i686' 'x86_64')
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html'
license=('LGPL')
makedepends=('rpmextract')
source=("http://pub.brother.com/pub/com/bsc/linux/dlf/dcp7065dnlpr-${pkgver/_/-}.i386.rpm")

build() {
    cd "$srcdir"
    rpmextract.sh "dcp7065dnlpr-${pkgver/_/-}.i386.rpm"
}

package() {
    cd "$srcdir"
    find . -type f | while read file
    do
        local newfile="${pkgdir}/${file}"
        install -DT "$file" "$newfile"
    done
    chmod a+w "${pkgdir}/usr/local/Brother/Printer/DCP7065DN/inf/brDCP7065DNrc"
    chmod a+w "${pkgdir}/usr/local/Brother/Printer/DCP7065DN/inf"

}

md5sums=('b0582aaca638f158abc0de4048128793')
