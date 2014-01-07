pkgname=brother-dcp8085dn-cupswrapper
pkgver=2.0.4_1
_pkgver="${pkgver//_/-}"

pkgrel=1
pkgdesc="CUPS driver for Brother DCP-8085DN printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('brother-dcp8085dn-lpr' 'cups')
makedepends=('rpmextract' 'findutils' 'sed')
url="http://solutions.brother.com/linux/en_us/index.html"


source=("http://pub.brother.com/pub/com/bsc/linux/dlf/cupswrapperDCP8085DN-${_pkgver}.i386.rpm")
md5sums=('a4dcdb7588d0f4ed972416617e37d320')

build() {
    cd "$srcdir"
    rpmextract.sh "cupswrapperDCP8085DN-${_pkgver}.i386.rpm"
}

package() {
    local exe="$(find usr -name 'cupswrapper*' -type f)"

    mkdir -p "${pkgdir}/usr/share/cups/model"
    sed -n '/ENDOFPPDFILE/,/ENDOFPPDFILE/p' "$exe" | sed '1 br; b; :r s/.*/cat <<ENDOFPPDFILE/' | bash > "${pkgdir}/usr/share/cups/model/DCP8085DN.ppd"

    mkdir -p "${pkgdir}/usr/lib/cups/filter"
    sed -n '/!ENDOFWFILTER!/,/!ENDOFWFILTER!/p' "$exe" | sed '1 br; b; :r s/.*/cat <<!ENDOFWFILTER!/' | bash > "${pkgdir}/usr/lib/cups/filter/brlpdwrapperDCP8085DN"
    chmod +x "${pkgdir}/usr/lib/cups/filter/brlpdwrapperDCP8085DN"

    cd "$srcdir"
    find . -type f | while read file
    do
        install -DT "$file" "${pkgdir}/${file}"
    done
}
