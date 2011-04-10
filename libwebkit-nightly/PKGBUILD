# Adapted from offical Arch PKG
# Maintainer: pyther <pyther@pyther.net>

pkgname=libwebkit-nightly
pkgver=83376
pkgrel=1
pkgdesc="an opensource web content engine - nightly builds"
arch=('i686' 'x86_64')
url="http://webkitgtk.org/"
license=('custom')
depends=('gtk2' 'libxt' 'libxslt' 'sqlite3' 'icu>=4.6' 'gstreamer0.10-base' 'libsoup' 'enchant')
makedepends=('gperf' 'gtk-doc' 'gobject-introspection' 'python2' 'gtk2')
provides=('libwebkit=1.3.13' 'webkitgtk-svn')
conflicts=('libwebkit')
options=('!libtool')
#For Latest Builds look at http://nightly.webkit.org
install=libwebkit.install
source=(http://builds.nightly.webkit.org/files/trunk/src/WebKit-r${pkgver}.tar.bz2) 
md5sums=('147fc319ce9af816638190613591cddd')

build() {
  cd "${srcdir}/WebKit-r${pkgver}"

  mkdir build-gtk2
  cd build-gtk2

  ../autogen.sh
  PYTHON=/usr/bin/python2 ../configure --prefix=/usr \
    --enable-video --enable-introspection \
    --with-font-backend=freetype --enable-gtk-doc \
    --enable-jit --with-unicode-backend=icu \
    --enable-3d-transforms --enable-mathml \
    --enable-spellcheck --with-gtk=2.0
  make all stamp-po
}

package() {
  cd "${srcdir}/WebKit-r${pkgver}/build-gtk2"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../Source/WebKit/LICENSE "${pkgdir}/usr/share/licenses/libwebkit/LICENSE"
}
