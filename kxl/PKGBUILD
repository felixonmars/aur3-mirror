# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=kxl
pkgver=1.1.7
pkgrel=1
pkgdesc="Multimedia library for game development"
arch=('i686' 'x86_64')
url="http://packages.debian.org/source/sid/kxl"
license=('LGPL')
depends=('glibc')
options=('!libtool')
source=("http://ftp.debian.org/debian/pool/main/k/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
        "kxl_64bit.patch"
        "kxl_font.patch")
md5sums=('321bfad9dee29840656225b54bb6feb0'
         '28028831b5aaa6c9a6d20bc79a077f1d'
         '8feb0f1f1b02a2ace4744c351302c1e0')

build() {
  cd "${srcdir}/KXL-${pkgver}"

  # Apply two debian patches
  patch -p0 -i ../kxl_64bit.patch
  patch -p0 -i ../kxl_font.patch

  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/KXL-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
