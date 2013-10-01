_pkgname=libmodplug
pkgname=mingw32-${_pkgname}
pkgver=0.8.8.4
pkgrel=0
pkgdesc="A MOD playing library (mingw32)"
arch=('any')
url="http://modplug-xmms.sourceforge.net/"
license=('custom')
depends=('mingw32-runtime')
makedepends=('mingw32-gcc')
options=(!libtool !strip !buildflags)
source=(http://downloads.sourceforge.net/modplug-xmms/${_pkgname}-${pkgver}.tar.gz
        libmodplug-CVE-2013-4233-Fix.patch libmodplug-CVE-2013-4234-Fix.patch)
sha1sums=('df4deffe542b501070ccb0aee37d875ebb0c9e22'
          'daee7fba80f633236a3d09ad19225c57013140e9'
          '2e870747261a86dce5056cbf077c5914e9e8b287')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -p2 -i "${srcdir}/libmodplug-CVE-2013-4233-Fix.patch"
  patch -p2 -i "${srcdir}/libmodplug-CVE-2013-4234-Fix.patch"
}

build() {
  cd ${_pkgname}-${pkgver}
  PKG_CONFIG_PATH=/usr/i486-mingw32/lib/pkgconfig \
  ./configure --disable-static \
  --host=i486-mingw32 \
  --prefix=/usr/i486-mingw32 \
  --enable-static \
  --enable-shared
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
