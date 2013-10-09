# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>

pkgname=lib32-libjpeg6
pkgver=6b1
pkgrel=1
pkgdesc="Legacy version of Library of JPEG support functions (32 bit)"
arch=('x86_64')
url="http://www.ijg.org/"
license=('custom')
depends=('lib32-glibc' 'libjpeg6')
makedepends=('gcc-multilib')
options=('!libtool' '!makeflags') # Chokes on -jX>1
source=("ftp://ftp.debian.org/debian/pool/main/libj/libjpeg6b/libjpeg6b_${pkgver}.orig.tar.gz"
        'LICENSE.txt')
sha256sums=('dbe673129e69eaaed47e3cfccf86b1582fa19862a3ce8189ea8f8cfc1800d9aa'
            '12251e75c39ee0436def9cdc0f7943a064eef1f0f536bdd1c30af3a1ffebe58e')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/jpeg-${pkgver}"
  ./configure --prefix=/usr --enable-shared --enable-static --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/jpeg-${pkgver}"
  make DESTDIR=${pkgdir} install
  rm -rf "${pkgdir}"/usr/{bin,share,include}
  rm "${pkgdir}"/usr/lib32/libjpeg.{a,so}
  install -Dm644 "${srcdir}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
