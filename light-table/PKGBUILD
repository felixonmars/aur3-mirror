# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=light-table
_pkgname=LightTable
pkgver=0.6.5
pkgrel=1
pkgdesc="A new interactive IDE that lets you modify running programs and embed anything from websites to games."
arch=('x86_64' 'i686')
url='http://www.lighttable.com/'
license=('GPL')
depends=('libudev.so.0' 'nss>=3.14.3' 'gconf')
source=("${_pkgname}.desktop")
md5sums=('154487451c9e12f1e6b49556d1f6481c')
options=('!strip')

if [[ ${CARCH} == "x86_64" ]]; then
    source+=("https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/${pkgver}/LightTableLinux64.tar.gz")
    md5sums+=('94d3f5906db70bfc272686160ae90d67')
elif [[ ${CARCH} == "i686" ]]; then
    source+=("https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/${pkgver}/LightTableLinux.tar.gz")
    md5sums+=('fe4f06707eb1eff509d3dce965019528')
fi

package() {
    cd "${srcdir}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    #use libudev.so.0 as dep and remove related function in launch script 
    sed -i -e '6,31d' "${_pkgname}/LightTable"
    mv -T "${_pkgname}" "${pkgdir}/opt/${_pkgname}"
    chmod -R 755 "${pkgdir}/opt/${_pkgname}"
}
