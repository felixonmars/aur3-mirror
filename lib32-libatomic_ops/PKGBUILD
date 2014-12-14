# Maintainer:  Jesse   Jaara      <gmail.com: jesse.jaara>
# Contributor: Jan     de Groot   <jgc@archlinux.org>
# Contributor: Adam    Walters    <abwalters@abwalters.us>
# Contributor: William Rea        <sillywilly@gmail.com>
# Contributor: Rémy    Oudompheng <remy@archlinux.org>

pkgname=lib32-libatomic_ops
pkgver=7.4.2
_tag=libatomic_ops-${pkgver//./_}
pkgrel=2
pkgdesc="Provides semi-portable access to hardware provided atomic memory operations"
arch=('i686' 'x86_64')
url="https://github.com/ivmai/libatomic_ops"
depends=('lib32-glibc')
makedepends=('gcc-multilib')
license=('GPL2' 'MIT')
source=(https://github.com/ivmai/libatomic_ops/archive/$_tag.zip)
md5sums=('7035692fec4db2659b06485040829e43')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd libatomic_ops-$_tag
  ./autogen.sh
  ./configure --prefix=/usr --disable-static --enable-shared --libdir=/usr/lib32
  make
}

check() {
  cd libatomic_ops-$_tag
  make check
}

package() {
  cd libatomic_ops-$_tag
  make DESTDIR="${pkgdir}" install
  install -D -m644 doc/LICENSING.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  rm -r "${pkgdir}/usr/share/libatomic_ops"
  rm -r "${pkgdir}/usr/include"
}

md5sums=('60384ffb3fc87d8b7f7e2abf24e1c3f0')
