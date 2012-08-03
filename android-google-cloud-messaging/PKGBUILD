# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-google-cloud-messaging
pkgver=r03
pkgrel=1
pkgdesc='Google Cloud Messaging for Android Library'
arch=('any')
url="http://developer.android.com/guide/google/gcm/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/gcm_${pkgver}.zip" "source.properties")
sha1sums=('ad066fd0dc7fc99d8aadac09c65a3c2519fbc7bf'
          '959459a9561434f05b2a33cc0d9dfe7fb03e28e8')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/gcm_${pkgver}" "${pkgdir}/opt/android-sdk/extras/google/gcm"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/gcm/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
