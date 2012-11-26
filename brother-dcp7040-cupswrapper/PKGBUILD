# Contributor: Roland Singer <roland@manjaro.org>

pkgname=brother-dcp7040-cupswrapper
pkgver=2.0.2_1
pkgrel=1
pkgdesc='CUPS driver for Brother laser printer DCP-7040'
arch=('i686' 'x86_64')
url='http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#DCP-7040'
license=('LGPL')
makedepends=('rpmextract' 'findutils' 'sed')
source=("http://pub.brother.com/pub/com/bsc/linux/dlf/cupswrapperDCP7040-${pkgver/_/-}.i386.rpm")

if [ "$CARCH" = "i686" ]; then
    depends=('brother-dcp7040-lpr' 'cups')
elif [ "$CARCH" = "x86_64" ]; then
    depends=('brother-dcp7040-lpr' 'cups' 'lib32-glibc')
fi

build() {
    cd "$srcdir"
    rpmextract.sh "cupswrapperDCP7040-${pkgver/_/-}.i386.rpm"
}

package() {
    local exe="$(find usr -name 'cupswrapper*' -type f)"

    mkdir -p "${pkgdir}/usr/share/cups/model"
    sed -n '/ENDOFPPDFILE/,/ENDOFPPDFILE/p' "$exe" | sed '1 br; b; :r s/.*/cat <<ENDOFPPDFILE/' | bash > "${pkgdir}/usr/share/cups/model/DCP7040.ppd"

    mkdir -p "${pkgdir}/usr/lib/cups/filter"
    sed -n '/!ENDOFWFILTER!/,/!ENDOFWFILTER!/p' "$exe" | sed '1 br; b; :r s/.*/cat <<!ENDOFWFILTER!/' | bash > "${pkgdir}/usr/lib/cups/filter/brlpdwrapperDCP7040"
    chmod +x "${pkgdir}/usr/lib/cups/filter/brlpdwrapperDCP7040"

    cd "$srcdir"
    find . -type f | while read file
    do
        install -DT "$file" "${pkgdir}/${file}"
    done
}

sha256sums=('04a515ed2a1a35eaf01d158fd8a0149d45b0a6167713b3fe424ffeffddcd94f0')
