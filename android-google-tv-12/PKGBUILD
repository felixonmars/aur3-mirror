# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-tv-12
pkgver=3.1_r02
pkgrel=1
pkgdesc='Android Google TV Addon, API-12'
arch=('any')
url="https://developers.google.com/tv/android/docs/gtv_addon"
license=('custom')
depends=('android-platform-12')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/google_tv-12_r02.zip")
sha1sums=('92128a12e7e8b0fb5bac59153d7779b717e7b840')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/add-ons/"
  mv "${srcdir}/addon_googletv_12" "${pkgdir}/opt/android-sdk/add-ons/addon-google_tv_addon-google_inc_-12"

  chmod -R ugo+rX "${pkgdir}/opt"
}
