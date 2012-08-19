# Maintainer: Stefano Gioffré <grossomalpelo at gmail dot com>

pkgname=sharelin
pkgver=0.2.6
pkgrel=3
pkgdesc="Gnutella2 leaf-mode p2p client with WebUI"
arch=("i686" "x86_64")
url="http://sharelin.sourceforge.net/"
license=("GPL")
depends=("boost-libs" "zlib")
makedepends=("cmake" "boost")
source=("http://downloads.sf.net/sourceforge/${pkgname}/${pkgname}-${pkgver}-src.tar.gz" "boost-1.50.0_or_later.diff" "sharelin_desktop.in" "sharelin.png")
md5sums=("6b45b43f8c889179090b8cd1687724f6" "29a8c86f0278b6b18dd97b3ec7f223a4" "4554385dcc1741e4eb6a08d99b326395" "f9460c688c86312cc1d81aa0a4b15103")

build() {
  mv "${srcdir}/boost-1.50.0_or_later.diff" "${srcdir}/${pkgname}-${pkgver}/boost-1.50.0_or_later.diff"
  mv "${srcdir}/sharelin_desktop.in" "${srcdir}/sharelin.desktop"
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -u -p0 -i "boost-1.50.0_or_later.diff"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -d "${pkgdir}/usr/share/"{pixmaps,applications}
  install -m644 "${srcdir}/sharelin.desktop" "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/sharelin.png" "${pkgdir}/usr/share/pixmaps"
}

# vim:set ts=2 sw=2 et: 
