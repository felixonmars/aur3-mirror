# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-cloud-messaging
pkgver=r01
pkgrel=1
pkgdesc='Google Cloud Messaging for Android Library'
arch=('any')
url="http://developer.android.com/guide/google/gcm/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/gcm_${pkgver}.zip" "source.properties")
sha1sums=('fff4bbfbf97de94f90c31f00bcd4579746f4a939'
          '9c3a977892f390f4b71b6a48a34485831a1e6d07')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/gcm_${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/gcm"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/gcm/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
