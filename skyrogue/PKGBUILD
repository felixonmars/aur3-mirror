# Maintainer: Javier Aravena Claramunt <javier@aravenas.com>
pkgname=skyrogue
pkgver=alpha_21
pkgrel=1
pkgdesc="Simple, accessible-yet-difficult, fwooshy, “feel good” flight sim."
arch=('x86_64' 'i686')
url="http://nihilocrat.itch.io/sky-rogue"
license=('custom')
depends=(libgl glu libxext libxcursor libxau alsa-lib)
source=("${pkgname}_launch" "${pkgname}_${pkgver}_linux.zip::dl://${pkgname}_${pkgver}_linux.zip")
md5sums=('021763e0061fbd893f7c94d8f74565a5'
         'eabd0e3a01971057398a91c8c11e3c49')

DLAGENTS=("dl::/usr/bin/echo Could not find %u, please manually download the file from ${url}; exit 1")

package() {
    cd "$srcdir/"
    install -d -m755 "${pkgdir}/opt/"
    cp -r "${pkgname}" "${pkgdir}/opt/${pkgname}"
    install -D -m755 "${pkgname}_launch" "${pkgdir}/usr/bin/${pkgname}"

    cd "${pkgdir}/opt/${pkgname}"
    if [[ "$CARCH" == 'x86_64' ]]; then
        mv "${pkgname}.x86_64" "${pkgname}"
        rm "${pkgname}.x86"
    elif [[ "$CARCH" == 'i686' ]]; then
        mv "${pkgname}.x86" "${pkgname}"
        rm "${pkgname}.x86_64"
    fi
    chmod 755 "${pkgname}"
}
