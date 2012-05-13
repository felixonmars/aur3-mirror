# Maintainer: Nathan Hulse <nat.hulse@gmail.com>

pkgname=libcompizconfig-dev
pkgseries=0.9.5
pkgver=${pkgseries}.92
pkgrel=3
pkgdesc="Compiz configuration system library"
arch=('i686' 'x86_64')
url="http://compiz.org"
license=('GPL')
provides=('libcompizconfig')
conflicts=('libcompizconfig')
depends=('compiz-core-dev' 'libxml2' 'protobuf')
makedepends=('intltool' 'pkgconfig' 'cmake')
source=("https://launchpad.net/compiz-libcompizconfig/${pkgseries}/${pkgver}/+download/libcompizconfig-${pkgver}.tar.bz2")
install='libcompizconfig-dev.install'
md5sums=('0dd03011cac8cc4bc0e0877e38bcca90')

# GSettings backend support
GSETTINGS="on"

build() {
  cd "libcompizconfig-${pkgver}"
  [[ -d build ]] || mkdir build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr"                     \
    -DCMAKE_BUILD_TYPE="Release"                      \
    -DCOMPIZ_BUILD_WITH_RPATH=FALSE                   \
    -DUSE_GSETTINGS="${GSETTINGS}"                    \
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=On               \
    -DCOMPIZ_DESTDIR="${pkgdir}"
  make
}

package() {
  cd "libcompizconfig-${pkgver}/build"
  make install
	make findcompizconfig_install

  # Add the pesky gsettings schema files manually
  ls generated | grep -qm1 .gschema.xml
  if [ $? -eq 0 ]; then
    msg "Adding GSettings schema files..."
    install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas/" 
    install -m644 generated/*.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/" 
  fi

  # Remove empty file /etc/compizconfig/config
  rm -rf "${pkgdir}/etc"
}
