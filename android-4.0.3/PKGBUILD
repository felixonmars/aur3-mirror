# Maintainer: wilson <bugs@pandorica.net>

pkgname=android-4.0.3
pkgver=r01
pkgrel=1
pkgdesc='Platform for Google Android SDK'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk>=r14')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"
_android_ver=android-15

source=("https://dl-ssl.google.com/android/repository/${_android_ver}_${pkgver}.zip")

md5sums=('af13f09331cc2c4e732b6e6a1a7cb458')

package() {
  cd "${pkgdir}"
  mkdir -p ${_platform}

  mv "${srcdir}/${pkgname}" ${pkgdir}/${_platform}/${_android_ver}

}
