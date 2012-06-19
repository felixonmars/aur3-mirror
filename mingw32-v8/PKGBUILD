# $Id$
# Maintainer: Rogof <fake.bios@gmail.com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=mingw32-v8
pkgver=3.9.9
pkgrel=1
pkgdesc='A fast and modern javascript engine (mingw32)'
arch=('i686' 'x86_64')
url='http://code.google.com/p/v8'
license=('BSD')
depends=('mingw32-runtime')
makedepends=('subversion' 'scons')
options=('!strip' '!buildflags')
source=('unused-var-fixes.patch')
sha1sums=('3273701751d317cb0b4039872faad31fa1956bb9')

build() {
  _source="http://v8.googlecode.com/svn/tags/$pkgver"
  svn checkout "$_source" "$srcdir/$pkgname-$pkgver"

  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fixes

  # Use ws2spi.h instead of wspiapi.h (mingw32 can't provide it)
  #sed -e 's/wspiapi.h/ws2spi.h/' -i src/win32-headers.h
  
  patch -Np0 < ../unused-var-fixes.patch

  # setup environment
  export CXX=i486-mingw32-g++ RANLIB=i486-mingw32-ranlib AR=i486-mingw32-ar

  scons mode=release library=static arch=ia32 os=win32
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  find include -type f \
    -exec install -Dm644 {} $pkgdir/usr/i486-mingw32/{} \;

  install -Dm755 libv8.a "$pkgdir/usr/i486-mingw32/lib/libv8.a"
}
