# Maintainer: Alex Ghoust <ghouts@skyper.homelinux.org>

pkgname=paragui
pkgver=1.1.8
pkgrel=2
pkgdesc="Graphics library for programms using SDL"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/paragui/"
license=('LGPL')
groups=()
depends=('sdl>=1.2.0' 'freetype2>=2.0.3' 'zlib' 'libpng' 'sdl_image>1.2.0' 'expat>=1.95.1' 'libsigcpp1.2')
source=("http://ftp.twaren.net/Unix/NonGNU/paragui/$pkgname-$pkgver.tar.gz"
		"patch.diff")
md5sums=('6741b8f704b47b2c6b62fef29759c89c'
         'dd0101d5303e4a3a5ef535f3b1099b12')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "${srcdir}/patch.diff" || return 1
  ./configure --prefix=/usr --enable-internalphysfs --enable-unicode || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
