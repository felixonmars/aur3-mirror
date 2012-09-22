# $Id: PKGBUILD 63971 2012-02-08 18:48:18Z pschmitz $
# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

_pkgbasename=flac
pkgname=libx32-$_pkgbasename
pkgver=1.2.1
pkgrel=8.1
pkgdesc="Free Lossless Audio Codec (x32 ABI)"
arch=('x86_64')
url="http://flac.sourceforge.net/"
license=('custom:Xiph' 'LGPL' 'GPL' 'FDL')
depends=('libx32-libogg' 'libx32-gcc-libs' $_pkgbasename)
makedepends=('nasm' gcc-multilib-x32)
options=('!libtool' '!makeflags')
source=(http://downloads.sf.net/sourceforge/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz
        flac-1.2.1-gcc-4.3-includes.patch)
md5sums=('153c8b15a54da428d1f0fadc756c22c7'
         'b9d245422bbc547b18a72897366bea77')
sha1sums=('bd54354900181b59db3089347cc84ad81e410b38'
          '7e9f8c2ef4d9daf5ddd20df63b608fe19b8c1560')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd ${srcdir}/${_pkgbasename}-${pkgver}
  patch -Np1 -i ${srcdir}/flac-1.2.1-gcc-4.3-includes.patch
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-shared \
              --disable-rpath --libdir=/usr/libx32
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
