# Maintainer: wilson <bugs@pandorica.net>

pkgname=android-4.0.3
pkgver=r02
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

md5sums=('4175f770609368582e964879d2450671')

package() {
  cd "${pkgdir}"
  mkdir -p ${_platform}

  mv "${srcdir}/android-4.0.4" ${pkgdir}/${_platform}/${_android_ver}

  # fix permissions
  chmod -R o+rX ${_platform}
}

# vim:set ts=2 sw=2 et:
