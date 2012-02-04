# Maintainer: wilson <bugs@pandorica.net>

pkgname=android-4.0
pkgver=r03
pkgrel=2
pkgdesc='Platform for Google Android SDK'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk>=r14')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"
_android_ver=android-14
_android_sub=2

source=("https://dl-ssl.google.com/android/repository/${_android_ver}_${pkgver}.zip")

md5sums=('39b37689bfa06af76790d05ae0a754c2')

package() {
  cd "${pkgdir}"
  mkdir -p ${_platform}

  mv "${srcdir}/${pkgname}.${_android_sub}" ${pkgdir}/${_platform}/${_android_ver}

}
