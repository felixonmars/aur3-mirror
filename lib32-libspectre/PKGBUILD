# Maintainer: quequotion <quequotion@bugmenot.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libspectre
pkgver=0.2.7
pkgrel=2
pkgdesc="Small library for rendering Postscript documents (32bit)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.freedesktop.org/wiki/Software/libspectre"
depends=('lib32-ghostscript>=9.00')
source=(http://libspectre.freedesktop.org/releases/libspectre-${pkgver}.tar.gz)
sha1sums=('a7efd97b82b84ff1bb7a0d88c7e35ad10cc84ea8')

build() {
  cd "${srcdir}/libspectre-${pkgver}"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --disable-static \
              --libdir=/usr/lib32 --libexecdir=/usr/lib32 --includedir=/usr/lib32/libspectre/include
  make
}

package() {
  cd "${srcdir}/libspectre-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}
}

