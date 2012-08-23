# Contributor: Guglielmo De Concini <guglielmo.deconcini@gmail.com>
#This PKGBUILD was created with parts of code i've found on the archwiki and on the archlinux forums 
pkgname=xerox-phaser-6010
pkgver=1.0.1
pkgrel=1
_dirname=rpm_1.01_20110222
_rpmname=Xerox-Phaser_6000_6010-1.0-1.i686.rpm
pkgdesc="Driver for the Xerox Phaser 6010"
url="http://www.support.xerox.com/support/phaser-6000/downloads/engb.html?operatingSystem=linux&fileLanguage=en_GB"
license=('custom')
arch=('i686' 'x86_64')
depends=('cups')
if test "$CARCH" == x86_64; then
  depends=("${depends[@]}" lib32-libcups lib32-libstdc++5 lib32-libtiff lib32-libpng)
fi
if test "$CARCH" == i686; then
  depends=("${depends[@]}" libcups libstdc++5 libtiff libpng)
fi
makedepends=('rpmextract' 'libtool')
source=(6000_6010_rpm_1.01_20110222.zip::http://www.support.xerox.com/support/phaser-6000/file-redirect/engb.html?operatingSystem=linux\&fileLanguage=en_GB\&contentId=116070)
md5sums=('f19dfec3afec150b797b773bbbe0eefe')
build() {
  cd ${srcdir}/${_dirname}
  rpmextract.sh ${_rpmname} || return 1
}

package() {
  cd ${srcdir}/${_dirname}
  cp -r usr ${pkgdir}
}

