# Maintainer: mockfrog <arch AT mockfrog DOT de>
# contributor: Côme "MCMic" BERNIGAUD <mcmic@free.fr>
# contributor: Marcin "eXine" M. <exine@jun.pl>
# contributor: Pal Lockheart <palxex@gmail.com>

pkgname=android-ndk-crystax
pkgver=7.5.3
pkgrel=1
pkgdesc="improved android C/C++ developer kit"
arch=(i686 x86_64)
url="http://www.crystax.net/de/android/ndk/7"
license=('GPL')
depends=(android-sdk)
conflicts=(android-ndk)
replaces=(android-ndk)
source=(http://www.crystax.net/en/download/android-ndk-r7-crystax-5.beta3-linux-x86.tar.bz2)
md5sums=('ffeb96597b529193e080c98a2469de96')
options=(!strip)

package() {

  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/etc/profile.d"
  echo "export PATH=\$PATH:/opt/${pkgname}" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
  echo "export ANDROID_NDK=/opt/${pkgname}" >> "${pkgdir}/etc/profile.d/${pkgname}.sh"
  chmod 755 "${pkgdir}/etc/profile.d/${pkgname}.sh"

  cp -a "${srcdir}/android-ndk-r7-crystax-5.beta3" "${pkgdir}/opt/${pkgname}"
}
