# Maintainer: wilson <bugs@pandorica.net>

pkgname=android-4.0
pkgver=r03
pkgrel=4
pkgdesc='Platform for Google Android SDK'
arch=('any')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk>=r14')
_android_api=android-14
_android_ver=android-4.0.2
_android_arm=armeabi-v7a
_sysimg_ver=14_r02
_android_sub=2
_platform="opt/android-sdk/platforms"
_images="opt/android-sdk/system-images/${_android_api}"

source=(
  https://dl-ssl.google.com/android/repository/${_android_api}_${pkgver}.zip
  https://dl-ssl.google.com/android/repository/sysimg_armv7a-${_sysimg_ver}.zip
)

md5sums=('39b37689bfa06af76790d05ae0a754c2'
         '3ab5916c429a1c7f017bfe7e341abeb4')

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
