# Maintainer: Filip Brcic <brcha@gna.org>

pkgname=android-ndk-necessitas
pkgver=r8e
pkgrel=3
pkgdesc="Android C/C++ NDK for the Necessitas Android Qt SDK"
arch=(i686 x86_64)
url="http://code.google.com/p/mingw-and-ndk/"
license=('GPL')
depends=(android-sdk)
conflicts=(android-ndk)
replaces=(android-ndk)
provides=(android-ndk)

# _arch="$(uname -m)"

# if [ ${_arch} = "x86_64" ]
# then
# source=("http://mingw-and-ndk.googlecode.com/files/android-ndk-${pkgver}-ma-linux-x86_64.tar.xz")
# md5sums=('c2074fc7d3b123e02393723a13d3358c')
# else
source=("http://mingw-and-ndk.googlecode.com/files/android-ndk-${pkgver}-ma-linux-x86.tar.xz")
md5sums=('02271cddeeba17fd9c335e472bd50c96')
# fi
options=(!strip)

package() {
  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/etc/profile.d"
  echo "export PATH=\$PATH:/opt/android-ndk" > "${pkgdir}/etc/profile.d/android-ndk.sh"
  echo "export ANDROID_NDK=/opt/android-ndk" >> "${pkgdir}/etc/profile.d/android-ndk.sh"
  chmod 755 "${pkgdir}/etc/profile.d/android-ndk.sh"

  cp -a "${srcdir}/android-ndk-${pkgver}" "${pkgdir}/opt/android-ndk"
}
