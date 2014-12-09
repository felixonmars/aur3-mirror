# Original Author: oklai
# Maintainer: JokerYu <dayushinn@gmail.com>
pkgname=koala-deb
pkgver=2.0.4
pkgrel=1
pkgdesc="A GUI application for Less, Sass, Compass and CoffeeScript compilation."
arch=("i686" "x86_64")
url="http://koala-app.com/"
license=("Apache")
options=(!strip)
depends=("gconf" "gtk2" "nss" "libudev.so.0")
optdepends=(
  "ruby: sass compilation support" 
  "nodejs-less: use system less compiler" 
  "ruby-sass: use system sass compiler" 
  "ruby-compass: use system compass compiler" 
  "coffee-script: use system coffee compiler"
)
conflicts=("koala")
_pkg=koala

if [ "$CARCH" = "x86_64" ];then
  _arch="amd64"
  md5sums=('1776fbc11ceceee91075e0477e7e0e9e')
elif [ "$CARCH" = "i686" ];then
  _arch="i386"
  md5sums=('9dce0d8e0bdd17d97462e85d4d391400')
fi

source=("${_pkg}_${pkgver}_${_arch}.deb")

# You should download the package manully.
# 64bit https://www.amazon.com/clouddrive/share/7pGigTDka_B70gNrR7hgSJY1eoM1KS6JTDZtUS1-JaA
# 32bit https://www.amazon.com/clouddrive/share/ro5D2Fix7Xf61Gd6GN2dLXJoGcEv6jaDq7gS2MUpW24

package() {
  tar xfp ${srcdir}/data.tar.xz -C ${pkgdir}/
  chmod -R 755 ${pkgdir}/usr
}