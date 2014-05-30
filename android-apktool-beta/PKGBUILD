# Maintainer: Jonathan Waldrep <spartan074 {at} gmail {dot} com>
# Contributor (original PKGBUILD): Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
pkgname=android-apktool-beta
pkgver=2.0.0rc1
pkgrel=1
pkgdesc="A tool for reengineering Android apk files. Uses JRE7."
arch=('i686' 'x86_64')
url="http://connortumbleson.com/2014/02/apktool-2-0-0-beta-9-released/"
license=('Apache')
depends=('java-runtime=7' 'android-sdk-build-tools')
provides=('android-apktool')
conflicts=('android-apktool')
source=(http://connortumbleson.com/apktool/test_versions/apktool_${pkgver}.jar
        http://android-apktool.googlecode.com/files/apktool-install-linux-r04-brut1.tar.bz2)
noextract=(apktool_${pkgver}.jar)
md5sums=('bdc25d5d347762667ed9ac1d8558f274'
         'f7fc0f06ebee9a975e5296296a396534')
  
package() {
  mkdir -p "${pkgdir}"/usr/bin
  install -m 0755 "${srcdir}"/apktool "${pkgdir}"/usr/bin
  install -m 0644 "${srcdir}"/apktool_${pkgver}.jar "${pkgdir}"/usr/bin/apktool.jar
}
