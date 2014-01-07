pkgname=brother-dcp8085dn-lpr
pkgver=2.0.3_1
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc='LPR driver for Brother printer DCP-8085DN'
arch=('i686' 'x86_64')
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html'
license=('LGPL')
makedepends=('rpmextract')
source=(http://www.brother.com/pub/bsc/linux/dlf/dcp8085dnlpr-2.0.3-1.i386.rpm)

md5sums=('1c036b69fd3a795fae7e88207155e591')

build() {
    cd "$srcdir"
    rpmextract.sh "dcp8085dnlpr-${_pkgver}.i386.rpm"
}

package() {
    cd "$srcdir"
    find . -type f | while read file
    do
        local newfile="${pkgdir}/${file}"
        install -DT "$file" "$newfile"
    done
    chmod a+w "${pkgdir}/usr/local/Brother/inf/brDCP8085DNrc"
    chmod a+w "${pkgdir}/usr/local/Brother/inf"
}

