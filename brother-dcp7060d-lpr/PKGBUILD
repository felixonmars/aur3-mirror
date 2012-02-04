pkgname=brother-dcp7060d-lpr
pkgver=2.1.0_1
pkgrel=1
pkgdesc='LPR driver for Brother laser printer DCP-7060D'
arch=('i686' 'x86_64')
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html'
license=('LGPL')
makedepends=('rpmextract')
source=("http://pub.brother.com/pub/com/bsc/linux/dlf/dcp7060dlpr-${pkgver/_/-}.i386.rpm")

build() {
    cd "$srcdir"
    rpmextract.sh "dcp7060dlpr-${pkgver/_/-}.i386.rpm"
}

package() {
    cd "$srcdir"
    find . -type f | while read file
    do
        local newfile="${pkgdir}/${file}"
        install -DT "$file" "$newfile"
    done
    chmod a+w "${pkgdir}/usr/local/Brother/Printer/DCP7060D/inf/brDCP7060Drc"
    chmod a+w "${pkgdir}/usr/local/Brother/Printer/DCP7060D/inf"

}

md5sums=('0bf7182e0f4d4b3fa2e9b71f8c090275')
