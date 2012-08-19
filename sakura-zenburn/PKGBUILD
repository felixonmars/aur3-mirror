# Maintainer: megadriver <megadriver at gmx dot com>
# Based on sakura from [community]

pkgname=sakura-zenburn
_pkgname=sakura
pkgver=3.0.4
pkgrel=1
pkgdesc="The Sakura terminal emulator, with the Tango palette replaced by a Zenburn-like one"
arch=('i686' 'x86_64')
url="https://launchpad.net/sakura"
license=('GPL')
depends=('vte3' 'libxft' 'desktop-file-utils')
makedepends=('cmake')
conflicts=('sakura')
source=("https://launchpad.net/sakura/trunk/${pkgver}/+download/${_pkgname}-${pkgver}.tar.bz2" $pkgname.patch)
sha1sums=('e4d3a7fce9600cbdec9fda1e6fd20f38ebb4655e'
          '830f23b5c42247bbcc1c8d7fcf8c43d0bbbf8f1f')
install=sakura.install

build() {
  cd $srcdir/${_pkgname}-${pkgver}

  # Replace Tango with Zenburn
  patch -p0 -i $srcdir/$pkgname.patch

  # Set default font size a bit smaller
  sed -i 's|#define DEFAULT_FONT "Bitstream Vera Sans Mono 14"|#define DEFAULT_FONT "Bitstream Vera Sans Mono 10"|g' src/sakura.c
 
  # build & install	
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE . 
  make 
}

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install 
  # extract the keybindings from the installed documentation, rest is only relevant during build time
  awk '/^Keybindings/{f="'${pkgdir}'/usr/share/doc/'${_pkgname}'/KEYBINDINGS"} f{print > f} /^END/' \
        ${pkgdir}/usr/share/doc/${_pkgname}/INSTALL
  rm ${pkgdir}/usr/share/doc/${_pkgname}/INSTALL
}
