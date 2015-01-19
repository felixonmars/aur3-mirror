# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=limba
pkgver=0.2.0
pkgrel=1
pkgdesc="Limba is a new project which allows 3rd-party software installations on Linux"
url="https://github.com/ximion/limba"
arch=('x86_64' 'i686')
license=('GPLv2' 'LGPL2.1')
depends=('glib2>=2.36' 'gobject-introspection' 'appstream' 'polkit' 'libarchive' 'gpgme' 'libutil-linux' )
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://people.freedesktop.org/~mak/limba/releases/Limba-${pkgver}.tar.xz)
md5sums=('5c67ffe14b45bf937e19fccb9b072466')

build() {
  cd ${srcdir}
  mv Limba-${pkgver} ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  mkdir build && cd build
  cmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd build 
  make DESTDIR="${pkgdir}" install
}