pkgname=brother-dcp7060d-cupswrapper
pkgver=2.0.4_2
pkgrel=1
pkgdesc='CUPS driver for Brother laser printer DCP-7060D'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('brother-dcp7060d-lpr' 'cups')
makedepends=('rpmextract' 'findutils' 'sed')
source=("http://pub.brother.com/pub/com/bsc/linux/dlf/cupswrapperDCP7060D-${pkgver/_/-}.i386.rpm")

build() {
    cd "$srcdir"
    rpmextract.sh "cupswrapperDCP7060D-${pkgver/_/-}.i386.rpm"
}

package() {
    local exe="$(find usr -name 'cupswrapper*' -type f)"

    mkdir -p "${pkgdir}/usr/share/cups/model"
    sed -n '/ENDOFPPDFILE/,/ENDOFPPDFILE/p' "$exe" | sed '1 br; b; :r s/.*/cat <<ENDOFPPDFILE/' | bash > "${pkgdir}/usr/share/cups/model/DCP7060D.ppd"

    mkdir -p "${pkgdir}/usr/lib/cups/filter"
    sed -n '/!ENDOFWFILTER!/,/!ENDOFWFILTER!/p' "$exe" | sed '1 br; b; :r s/.*/cat <<!ENDOFWFILTER!/' | bash > "${pkgdir}/usr/lib/cups/filter/brlpdwrapperDCP7060D"
    chmod +x "${pkgdir}/usr/lib/cups/filter/brlpdwrapperDCP7060D"

    cd "$srcdir"
    find . -type f | while read file
    do
        install -DT "$file" "${pkgdir}/${file}"
    done
}
md5sums=('eda57513b79e42be5a232073495767cf')
