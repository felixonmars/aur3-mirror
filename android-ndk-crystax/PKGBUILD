# Maintainer: mockfrog <arch AT mockfrog DOT de>
# contributor: Côme "MCMic" BERNIGAUD <mcmic@free.fr>
# contributor: Marcin "eXine" M. <exine@jun.pl>

pkgname=android-ndk-crystax
pkgver=6.2
pkgrel=1
pkgdesc="android C/C++ developer kit with enabled support of C++ exceptions, RTTI and Standard C++ Library"
arch=(i686 x86_64)
url="http://www.crystax.net/de/android/ndk/6"
license=('GPL')
depends=(android-sdk)
conflicts=(android-ndk)
replaces=(android-ndk)
source=(http://www.crystax.net/en/download/android-ndk-r6-crystax-2-linux-x86.tar.bz2)
md5sums=('f7d4dd14de0a27dffcd208ff919be98d')
options=(!strip)

package() {

  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/etc/profile.d"
  echo "export PATH=\$PATH:/opt/${pkgname}" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
  echo "export ANDROID_NDK=/opt/${pkgname}" >> "${pkgdir}/etc/profile.d/${pkgname}.sh"
  chmod 755 "${pkgdir}/etc/profile.d/${pkgname}.sh"

  cp -a "${srcdir}/android-ndk-r6-crystax-2" "${pkgdir}/opt/${pkgname}"
}
