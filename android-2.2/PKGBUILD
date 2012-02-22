# Maintainer: wilson <bugs@pandorica.net>

pkgname=android-2.2
pkgver=r03
pkgrel=2
pkgdesc='Platform for Google Android SDK'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk>=r12')
_sdk=android-sdk
_platform="opt/${_sdk}/platforms"

source=("https://dl-ssl.google.com/android/repository/${pkgname}_${pkgver}-linux.zip")

md5sums=('8a43976aeba296144c82905ad88e8ee9')

package() {
  cd "${pkgdir}"
  mkdir -p ${_platform}

  mv "${srcdir}/${pkgname}_${pkgver}-linux" ${pkgdir}/${_platform}/${_android_ver}

  # fix permissions
  chmod -R o+rX ${_platform}
}

# vim:set ts=2 sw=2 et:
