pkgname=android-google-android-support-library
pkgver=r22.1.1
pkgrel=1
pkgdesc='Android support library'
arch=('any')
url="https://developer.android.com/index.html"
license=('custom')
options=('!strip')
source=("http://dl.google.com/android/repository/support_${pkgver}.zip" "source.properties")
sha1sums=('88bdc7b4074065ed28681f39e6b32c4f7ab45d94'
          '163ed111a4c8098cb9db2248a426618da074deb6')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/android/"
  cp -dpr --no-preserve=ownership "${srcdir}/support" "${pkgdir}/opt/android-sdk/extras/android/support"
  chmod -R ugo+rX "${pkgdir}/opt"
  install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/android/support/source.properties"
}
