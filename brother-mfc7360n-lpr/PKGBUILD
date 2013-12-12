# Maintainer: Martin Wimpress <code@flexion.org>

pkgname=brother-mfc7360n-lpr
pkgver=2.1.0
pkgrel=2
_pkgrel=1
pkgdesc="Brother MFC-7360N LPR driver"
url="http://solutions.brother.com/linux/en_us/download_prn.html#MFC-7360N"
license=('custom:Brother' 'GPL')
depends=('ghostscript' 'psutils')
makedepends=('rpmextract')
install="brother-mfc7360n-lpr.install"
arch=('i686' 'x86_64')
source=(http://www.brother.com/pub/bsc/linux/dlf/mfc7360nlpr-${pkgver}-${_pkgrel}.i386.rpm)
md5sums=('1b836f70da84f0b8d27b9657774598a5')

if [ "${CARCH}" == "x86_64" ]; then
    depends+=('lib32-glibc')
fi

prepare() {
    cd "${srcdir}"
    for RPM in *.rpm; do
        rpmextract.sh "${RPM}"
    done
}

package() {
    cp -R "${srcdir}/usr" "${pkgdir}"
    cp -R "${srcdir}/var" "${pkgdir}"
}
