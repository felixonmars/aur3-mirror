# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: scj <scj@archlinux.us>

pkgname=agar
pkgver=1.4.1
pkgrel=2
pkgdesc="Modern cross-platform toolkit for graphical applications implemented in C, C++ and Ada"
arch=('i686' 'x86_64')
url="http://libagar.org"
license=('custom:BSD')
depends=('sh')
optdepends=('sdl: If you want to use the sdlfb or sdlgl'
            'freetype2: Improve Font Rendering'
            'libgl: Mesa OpenGL support for sdlgl (intel-dri, nouveau-dir, etc.)'
            'nvidia-utils: Nvidia proprietary OpenGL support for sdlgl'
            'catalyst-utils: AMD/ATI proprietary OpenGL support for sdlgl')
conflicts=('agar-svn')
options=('!emptydirs' '!libtool')
source=("http://stable.hypertriton.com/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ce71fb11ad79c926a968a4ed29053820')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Necessary workaround for gcc 4.6
  export CFLAGS="$CFLAGS -Wno-unused-but-set-variable"
  ./configure --prefix=/usr \
	  --with-gl=/usr \
	  --bindir=/usr/bin \
	  --libdir=/usr/lib \
	  --sharedir=/usr/share \
	  --with-catman=no \
	  --with-gl=/usr # set "prefix_gl" for /usr/lib/libGL.so

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # make install won't create these folders, even though they are required
  mkdir -p "$pkgdir/usr"/{bin,lib}
  mkdir -p "$pkgdir/usr/share/man"/man{3,5}
  mkdir -p "$pkgdir/usr/share/agar/fonts"
  
  make  DESTDIR="$pkgdir" MANDIR=/usr/share/man LIBDIR=/usr/lib install
  install -Dm644 ada-core/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
