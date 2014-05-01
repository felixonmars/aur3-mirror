# Maintainer: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkver=3.2
_sdkint=13
pkgname=android-google-tv-${_sdkint}
pkgver=${_sdkver}_${_rev}
pkgrel=2
pkgdesc="Android Google TV Addon, API-${_sdkint}"
arch=('any')
url="https://developers.google.com/tv/android/docs/gtv_addon"
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/android/repository/google_tv-${_sdkint}_${_rev}.zip"
        'source.properties')
sha1sums=('b73f7c66011ac8180b44aa4e83b8d78c66ea9a09'
          '9ab69feb330ff27e658ea6d63d539440634353be')
package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/addon_googletv_${_sdkint}" "${pkgdir}/opt/android-sdk/add-ons/addon-google_tv_addon-google-${_sdkint}"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/add-ons/addon-google_tv_addon-google-${_sdkint}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
