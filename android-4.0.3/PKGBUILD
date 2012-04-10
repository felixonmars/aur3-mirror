# Maintainer: wilson <bugs@pandorica.net>

pkgname=android-4.0.3
pkgver=r03
pkgrel=3
pkgdesc='Platform for Google Android SDK'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk>=r17')
_android_api=android-15
_android_ver=android-4.0.4
_android_arm=armeabi-v7a
_sysimg_ver=15_r02
_platform="opt/android-sdk/platforms"
_images="opt/android-sdk/system-images/${_android_api}"

source=(
  https://dl-ssl.google.com/android/repository/${_android_api}_${pkgver}.zip
  https://dl-ssl.google.com/android/repository/sysimg_armv7a-${_sysimg_ver}.zip
)

md5sums=('4c762338ad46f57babcc91e5bbefb15b'
         '447d9f076139e4e3fda3f26e39fef655')

build() {
  # fix permissions
  chmod -R o+rX ${srcdir}/${_android_ver}
  chmod -R o+rX ${srcdir}/${_android_arm}
  
  cd ${pkgdir}
  mkdir -p ${_platform}
  mkdir -p ${_images}
}

package() {
  mv ${srcdir}/${_android_ver} ${pkgdir}/${_platform}/${_android_api}
  mv ${srcdir}/${_android_arm} ${pkgdir}/${_images}/${_android_arm}
}

# vim:set ts=2 sw=2 et:
