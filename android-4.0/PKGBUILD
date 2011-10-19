# Maintainer: wilson <bugs@pandorica.net>

pkgname=android-4.0
pkgver=r01
pkgrel=1
pkgdesc='Platform for Google Android SDK'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk>=r14')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"
_android_ver=android-14
_android_sub=1

source=("https://dl-ssl.google.com/android/repository/${_android_ver}_${pkgver}.zip")

md5sums=('eaa78e221ff116ab6dfeb32c72df3b47')

package() {
  cd "${pkgdir}"
  mkdir -p ${_platform}

  mv "${srcdir}/${pkgname}.${_android_sub}" ${pkgdir}/${_platform}/${_android_ver}

}
