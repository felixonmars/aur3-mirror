#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=tegra-devpack
pkgver=1.0r8
_pkgver=1.0
_pkgdate=2012-05-09
_pkgbuild=12749879
pkgrel=1
pkgdesc="The Tegra Android Developer Pack, eclipse tools and documentation"
license=('custom')
arch=('any')
url="http://developer.nvidia.com/category/zone/mobile-development"

depends=('eclipse>=3.7.1' 'eclipse-cdt>=8.0.0' 'eclipse-android>=18.0.0'
         'apache-ant>=1.8.2' 'android-sdk>=r18' 'android-ndk>=r8c'
         'android-sdk-platform-tools>=r11' 'tegra-toolkit')
makedepends=('jre6-compat')

[ "$CARCH" = "i686"   ] && _pkgarch="linux"
[ "$CARCH" = "x86_64" ] && _pkgarch="linux-x64"
source=("http://developer.nvidia.com/sites/default/files/akamai/tools/files/Tegra/$pkgname-$_pkgver-$_pkgarch-$_pkgdate-$_pkgbuild.run"
        "license")
[ "$CARCH" = "i686"   ] && md5sums=('d121a63e78e592800ac3d8b702770514')
[ "$CARCH" = "x86_64" ] && md5sums=('1ed49e8028f668d2e84a1c816f8b0d1b')
md5sums+=('8e7f961bc6688fdbf8cc241fe247f21d')

options=(!strip)

build() {
  cd "${srcdir}"
  rm -rf NVPACK
  rm -rf instinfo
  for i in {1..12}
  do
    echo >> instinfo
  done
  echo "y" >> instinfo # accept license
  echo "n" >> instinfo # we install SDK and NDK from packages
  echo "n" >> instinfo # samples are in tegra-toolkit
  echo "n" >> instinfo # we install Eclipse, CDT and ADT from packages
  echo "y" >> instinfo #  (debuger)
  echo "n" >> instinfo # we install apache-ant from packages
  echo "y" >> instinfo #  (documentation)
  echo "y" >> instinfo # information is correct
  echo "$srcdir/NVPACK" >> instinfo # extract to $srcdir
  chmod a+x ./$pkgname-$_pkgver-$_pkgarch-$_pkgdate-$_pkgbuild.run
  PATH="/opt/java6/jre/bin:$PATH"
  cat instinfo | ./$pkgname-$_pkgver-$_pkgarch-$_pkgdate-$_pkgbuild.run --mode text > /dev/null
}

package() {
  cd "${srcdir}/NVPACK"
  install -m 644 -D "docs/NVIDIA Debug Manager for Android NDK.pdf" "$pkgdir/usr/share/tegra/docs/NVIDIA Debug Manager for Android NDK.pdf"
  install -d "$pkgdir/usr/share/eclipse/dropins/tegra-devkit/eclipse"
  unzip -o "NVDebugMgrForAndroidNDK_14.0.1.zip" -d "$pkgdir/usr/share/eclipse/dropins/tegra-devkit/eclipse"
  install -m 644 -D "$srcdir/license" "$pkgdir/usr/share/licenses/$pkgname/license"
}

