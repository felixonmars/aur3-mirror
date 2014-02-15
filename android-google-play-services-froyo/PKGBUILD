# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <pks-at-joelpedraza.com>

pkgname=android-google-play-services-froyo
pkgver=r12
_build=3265130
pkgrel=1
pkgdesc='Google Play Services client library and sample code'
arch=('any')
url="https://developers.google.com/android/google-play-services/"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/google_play_services_${_build}_${pkgver}.zip" "source.properties")
sha1sums=('92558dbc380bba3d55d0ec181167fb05ce7c79d9'
          'a691fdcb96dda9b005f19defdc46154f03b2a3fa')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/google/"
  mv "${srcdir}/google-play-services" "${pkgdir}/opt/android-sdk/extras/google/google_play_services_froyo"
  cp "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/google_play_services_froyo"

  chmod -R ugo+rX "${pkgdir}/opt"
}
