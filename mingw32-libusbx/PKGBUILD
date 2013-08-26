# Contributor: Colin Pitrat <colin.pitrat@gmail.com>
# Maintainer: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=mingw32-libusbx
pkgver=1.0.16
pkgrel=1
pkgdesc="Library to enable user space application programs to communicate with USB devices"
arch=('any')
depends=('mingw32-gcc' 'sh')
url="http://libusbx.org/"
license=('LGPL')
source=(http://downloads.sourceforge.net/libusbx/releases/${pkgver}/libusbx-${pkgver}.tar.bz2)
options=('!libtool' '!strip')
md5sums=('7f5715d624cd6c26b30a317eb6c2fe5e')

build() 
{
  cd "$srcdir/libusbx-$pkgver"
  
  unset LDFLAGS CFLAGS CPPFLAGS
  mkdir -p build-i486-mingw32 
  pushd build-i486-mingw32
  ../configure --prefix=/usr/i486-mingw32 --host=i486-mingw32
  make
  popd
}

package()
{
    cd ${srcdir}/libusbx-${pkgver}/build-i486-mingw32
    make install DESTDIR=${pkgdir}
    i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/bin/*.dll
    i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a    
}
