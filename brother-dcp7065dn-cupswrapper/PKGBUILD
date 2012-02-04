pkgname=brother-dcp7065dn-cupswrapper
pkgver=2.0.4_2
pkgrel=1
pkgdesc='CUPS driver for Brother laser printer DCP-7065DN'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('brother-dcp7065dn-lpr' 'cups')
makedepends=('rpmextract' 'findutils' 'sed')
source=("http://pub.brother.com/pub/com/bsc/linux/dlf/cupswrapperDCP7065DN-${pkgver/_/-}.i386.rpm")

build() {
    cd "$srcdir"
    rpmextract.sh "cupswrapperDCP7065DN-${pkgver/_/-}.i386.rpm"
}

package() {
    local exe="$(find usr -name 'cupswrapper*' -type f)"

    mkdir -p "${pkgdir}/usr/share/cups/model"
    sed -n '/ENDOFPPDFILE/,/ENDOFPPDFILE/p' "$exe" | sed '1 br; b; :r s/.*/cat <<ENDOFPPDFILE/' | bash > "${pkgdir}/usr/share/cups/model/DCP7065DN.ppd"

    mkdir -p "${pkgdir}/usr/lib/cups/filter"
    sed -n '/!ENDOFWFILTER!/,/!ENDOFWFILTER!/p' "$exe" | sed '1 br; b; :r s/.*/cat <<!ENDOFWFILTER!/' | bash > "${pkgdir}/usr/lib/cups/filter/brlpdwrapperDCP7065DN"
    chmod +x "${pkgdir}/usr/lib/cups/filter/brlpdwrapperDCP7065DN"

    cd "$srcdir"
    find . -type f | while read file
    do
        install -DT "$file" "${pkgdir}/${file}"
    done
}

md5sums=('2c7b96d7f23cc2f0d793e1e4e79fc1ab')
