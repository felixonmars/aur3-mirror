# Maintainer: Filip Brcic <brcha@gna.org>

pkgname=android-ndk-necessitas
pkgver=r8d
pkgrel=1
pkgdesc="Android C/C++ NDK for the Necessitas Android Qt SDK"
arch=(i686 x86_64)
url="http://code.google.com/p/mingw-and-ndk/"
license=('GPL')
depends=(android-sdk)
conflicts=(android-ndk)
replaces=(android-ndk)
provides=(android-ndk)
source=("http://mingw-and-ndk.googlecode.com/files/android-ndk-r8d-ma-linux-multiarch.7z")
md5sums=('7fb9c56ef686262b6127436ebb28977a')
options=(!strip)

package() {
  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/etc/profile.d"
  echo "export PATH=\$PATH:/opt/android-ndk" > "${pkgdir}/etc/profile.d/android-ndk.sh"
  echo "export ANDROID_NDK=/opt/android-ndk" >> "${pkgdir}/etc/profile.d/android-ndk.sh"
  chmod 755 "${pkgdir}/etc/profile.d/android-ndk.sh"

  cp -a "${srcdir}/android-ndk-${pkgver}" "${pkgdir}/opt/android-ndk"
}
