# Maintainer: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: 

_pkgbasename=cmt
pkgname=lib32-$_pkgbasename
pkgver=1.16
pkgrel=2
pkgdesc="CMT for LADSPA (32 bit)"
arch=('x86_64')
license=('GPL')
url="http://www.ladspa.org"
depends=('lib32-ladspa' 'lib32-gcc-libs')
makedepends=('gcc-multilib')
source=(http://www.ladspa.org/download/${_pkgbasename}_src_${pkgver}.tgz)
md5sums=('15a875e5aaf79c209c223babfb41cb1c')

build() {
  cd "${srcdir}/${_pkgbasename}/src"
  
  [ -f makefile-orig ] && mv makefile{-orig,} # allow rebuild
  # Fix directories and compiler flags for a lib32 package
  sed -i-orig \
	-e '/INSTALL_PLUGINS_DIR/s/lib/&32/' \
	-e 's|^CFLAGS|CXX\t\t\=\tg++ -m32\nCFLAGS|g' \
	-e "/CFLAGS/ s/-O3/${CFLAGS}/" \
	-e 's|-Werror||g' \
	makefile
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}/src"
  install -d -m755 "${pkgdir}/usr/lib32/ladspa/"
  install -m755 ../plugins/cmt.so "${pkgdir}/usr/lib32/ladspa/"
}
