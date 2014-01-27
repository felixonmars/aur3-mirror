# Maintainer: Maximilien Noal <noal dot maximilien at gmail dot com> [AUR: xcomcmdr]
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=sdl_net
pkgname=lib32-$_pkgbase
pkgver=1.2.8
pkgrel=1
pkgdesc="A small sample cross-platform networking library (32 bit)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_net/"
license=('custom')
depends=('lib32-sdl' "$_pkgbase")
makedepends=('gcc-multilib')
options=('!libtool')
source=(${url}/release/SDL_net-${pkgver}.tar.gz)
md5sums=('20e64e61d65662db66c379034f11f718')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd ${srcdir}/SDL_net-${pkgver}
  ./configure --prefix=/usr --disable-static --libdir=/usr/lib32 
  make
}

package() {
  cd ${srcdir}/SDL_net-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -rf ${pkgdir}/usr/include
  install -d "$pkgdir/usr/share/licenses"
  ln -s $_pkgbase "$pkgdir/usr/share/licenses/$pkgname"
}

