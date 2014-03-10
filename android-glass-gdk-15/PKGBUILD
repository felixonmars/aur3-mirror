# Maintainer: Michael Hansen <zrax0111 gmail com>

_rev=r02
_gdkver=xe12
_sdkint=15
pkgname=android-glass-gdk-${_sdkint}
pkgver=${_gdkver}_${_rev}
pkgrel=2
pkgdesc="Google Glass Development Kit Sneak Peek, API-${_sdkint}"
arch=('any')
url='https://developers.google.com/glass/develop/gdk/index'
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/glass/${_gdkver}/google-gdk.zip"
        'source.properties.xz')
sha1sums=('c3d1bc88dec04a92a2cdd3d79ce96f8ea1df7dfa'
          '086ae49ed402b33c43c621e211e3a1bbe3fd4bf2')

package() {
    _addons="${pkgdir}/opt/android-sdk/add-ons"
    mkdir -p "${_addons}"
    mv "${srcdir}/google-gdk" "${_addons}/addon-google_gdk-google-${_sdkint}"

    chmod -R ugo+rX "${pkgdir}/opt"

    xz -cd "${srcdir}/source.properties.xz" \
        > "${_addons}/addon-google_gdk-google-${_sdkint}/source.properties"
}
