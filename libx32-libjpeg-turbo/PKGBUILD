# $Id: PKGBUILD 73347 2012-07-06 15:35:45Z bluewind $
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

_pkgbasename=libjpeg-turbo
pkgname=libx32-$_pkgbasename
pkgver=1.2.1
pkgrel=1.1
pkgdesc="libjpeg derivative with accelerated baseline JPEG compression and decompression (x32 ABI)"
arch=('x86_64')
url="http://libjpeg-turbo.virtualgl.org/"
license=('GPL' 'custom')
depends=('libx32-glibc' $_pkgbasename)
makedepends=('nasm' 'gcc-multilib-x32')
provides=('libx32-libjpeg=8.0.2')
conflicts=('libx32-libjpeg')
replaces=('libx32-libjpeg')
options=('!libtool')
source=(http://sourceforge.net/projects/$_pkgbasename/files/$pkgver/$_pkgbasename-$pkgver.tar.gz)
sha1sums=('a4992e102c6d88146709e8e6ce5896d5d0b5a361')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  sed -i "s|NAFLAGS='-felf64 -DELF -D__x86_64__'|NAFLAGS='-felf32 -DELF -D__x86_64__'|" configure
  ./configure --prefix=/usr --with-jpeg8 --mandir=/usr/share/man --libdir=/usr/libx32 --without-simd
  make
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  make DESTDIR="$pkgdir/" install

  # do not distributre libturbojpeg as it is unversioned
  rm "$pkgdir"/usr/libx32/libturbojpeg.{so,a}

  rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
