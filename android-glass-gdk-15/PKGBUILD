# Maintainer: Michael Hansen <zrax0111 gmail com>

_rev=r02
_gdkver=xe12
_sdkint=15
pkgname=android-glass-gdk-${_sdkint}
pkgver=${_gdkver}_${_rev}
pkgrel=1
pkgdesc="Google Glass Development Kit Sneak Peek, API-${_sdkint}"
arch=('any')
url='https://developers.google.com/glass/develop/gdk/index'
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/glass/${_gdkver}/google-gdk.zip")
sha1sums=('c3d1bc88dec04a92a2cdd3d79ce96f8ea1df7dfa')

package() {
    mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
    mv "${srcdir}/google-gdk" "${pkgdir}/opt/android-sdk/add-ons/addon-google_gdk-google-${_sdkint}"

    chmod -R ugo+rX "${pkgdir}/opt"
}
