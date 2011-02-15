# Maintainer: TryA <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=bug-buddy
pkgname=lib32-bug-buddy
pkgver=2.32.0
pkgrel=5
pkgdesc="A bug reporting tool for GNOME (32-bit)"
arch=('x86_64')
depends=('lib32-gconf' 'lib32-libsoup' 'lib32-libgtop>=2.28.1' 'lib32-elfutils' 'lib32-libbonobo>=2.32.0')
#depends=('evolution-data-server>=2.32.0' 'lib32-libgtop>=2.28.1' 'lib32-elfutils' 'hicolor-icon-theme' 'lib32-libbonobo>=2.32.0' 'bug-buddy')
makedepends=('intltool' 'pkgconfig' 'gnome-doc-utils>=0.20.1' 'gcc-multilib')
license=('GPL')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbasename}/2.32/${_pkgbasename}-${pkgver}.tar.bz2)
sha256sums=('ffdc70fe4a59c0aef42b5b0b72b08f17db2b1d9f49ba2b68722334ddbee5e3ca')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib32 \
      --localstatedir=/var --disable-static --disable-eds --program-suffix=32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/etc
  rm -rf ${pkgdir}/usr/{include,share}
}
