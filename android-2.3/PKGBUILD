# Maintainer: wilson <bugs@pandorica.net>

pkgname=android-2.3
pkgver=r02
pkgrel=2
pkgdesc='Platform for Google Android SDK'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk>=r12')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"
_android_sub=3

source=("https://dl-ssl.google.com/android/repository/${pkgname}.${_android_sub}_${pkgver}-linux.zip")

md5sums=('0a9544ceb7a69947d2a0a33220aaacf2')

package() {
  cd "${pkgdir}"
  mkdir -p ${_platform}

  mv "${srcdir}/${pkgname}.${_android_sub}_${pkgver}-linux" ${pkgdir}/${_platform}/${_android_ver}

  # fix permissions
  chmod -R o+rX ${_platform}
}

# vim:set ts=2 sw=2 et:
