pkgname=brother-dcp7055-lpr
pkgver=2.1.0_1
pkgrel=1
pkgdesc='LPR driver for Brother laser printer DCP-7055'
arch=('i686' 'x86_64')
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html'
license=('LGPL')
makedepends=('rpmextract')
source=("http://pub.brother.com/pub/com/bsc/linux/dlf/dcp7055lpr-${pkgver/_/-}.i386.rpm")

build() {
    cd "$srcdir"
    rpmextract.sh "dcp7055lpr-${pkgver/_/-}.i386.rpm"
}

package() {
    cd "$srcdir"
    find . -type f | while read file
    do
        local newfile="${pkgdir}/${file}"
        install -DT "$file" "$newfile"
    done
    chmod a+w "${pkgdir}/usr/local/Brother/Printer/DCP7055/inf/brDCP7055rc"
    chmod a+w "${pkgdir}/usr/local/Brother/Printer/DCP7055/inf"

}

md5sums=('364b4c661fc8e5b4c623122df4fe1c5d')
