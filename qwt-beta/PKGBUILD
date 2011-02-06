# Maintainer: neon <PM on bbs.archlinux.org for contact>
pkgname=qwt-beta
#Note that "-rc5" should be part of the version, but hyphens are not allowed by makepkg
pkgver=6.0.0
pkgrel=1
pkgdesc="The Qwt library contains GUI Components and utility classes which are primarily useful for programs with a technical background. Beside a 2D plot widget it provides scales, sliders, dials, compasses, thermometers, wheels and knobs to control or display values, arrays, or ranges of type double."
arch=('i686' , 'x86_64')
url="http://qwt.sourceforge.net/"
license=('Qwt License, Version 1.0')
depends=('qt')
conflicts=('qwt')
makedepends=('qt')
source=(http://sourceforge.net/projects/qwt/files/qwt-beta/$pkgver-rc5/qwt-$pkgver-rc5.tar.bz2)
md5sums=('ff7f2cf6aef416f0addd2378473b4672')

build() {
  cd "$srcdir/qwt-$pkgver-rc5"
  sed -i -e 's/$${QWT_INSTALL_PREFIX}\/doc/\/usr\/share\/doc\/qwt\//' qwtconfig.pri
  sed -i -e 's/$${QWT_INSTALL_PREFIX}\/include/\/usr\/include\/qwt\//' qwtconfig.pri
  sed -i -e 's/$${QWT_INSTALL_PREFIX}\/lib/\/usr\/lib\//' qwtconfig.pri
  sed -i -e 's/$${QWT_INSTALL_PREFIX}\/plugins\/designer/\/usr\/lib\/qt\/plugins\/designer\//' qwtconfig.pri
  sed -i -e 's/$${QWT_INSTALL_PREFIX}\/features/\/usr\/share\/qwt\/features\//' qwtconfig.pri

# Commenting out this error only disallows the forced usage of a local project version of libqwt.
# This is also done in the official arch package for the non-beta version.
  sed -i -e 's/error/#error/' qwtbuild.pri

  qmake
  make
}

package() {
  cd "$srcdir/qwt-$pkgver-rc5"

  make INSTALL_ROOT="$pkgdir/" install
}
