# Maintainer: John Schroeder <jschroed@gmail.com>

pkgname=lib32-sdl1.2
pkgver=1.2.15
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 1.2). (32 bit)"
arch=('x86_64')
url="http://www.libsdl.org"
license=('MIT')
depends=('lib32-glibc' 'bash')
options=('!libtool')
conflicts=('lib32-sdl1.2-hg')
source=("http://www.libsdl.org/release/SDL-${pkgver}.tar.gz")
sha256sums=('d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00')

prepare()
{
  mkdir -p "$srcdir/SDL-${pkgver}/build/"
}

build() 
{
  export CC='gcc -m32'
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "$srcdir/SDL-${pkgver}/build/"
  ../configure --prefix=/usr --libdir=/usr/lib32
  make
}

package()
{
  cd "$srcdir/SDL-${pkgver}/build/"
  make DESTDIR="$pkgdir" install

  #already included in sdl-hg
  rm -rf "$pkgdir/usr/share/man" "$pkgdir/usr/share/aclocal/" "$pkgdir/usr/include/" "${pkgdir}/usr/bin/"

  install -Dm644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
