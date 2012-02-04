# Contributor: napa3um <napa3um@gmail.com>
#Maintainer: schalaalexiazeal@gmail.com

pkgname=mingw32-wxmsw-static
pkgver=2.8.12
pkgrel=1
pkgdesc="wxMSW is a port of wxWidgets for MS Windows. Static version."
arch=('i686' 'x86_64')
url='http://www.wxwidgets.org/'
license=('custom:wxWindows')
makedepends=('mingw32-w32api' 'mingw32-gcc' 'mingw32-binutils')
conflicts=('mingw32-wxmsw')
replaces=('mingw32-wxmsw')
options=(!strip !buildflags)
source=(http://downloads.sourceforge.net/wxwindows/wxMSW-$pkgver.tar.bz2)
md5sums=('4bda849b9f7c66b58c4bc92e505ea714')

build() {
  cd ${srcdir}/wxMSW-${pkgver}
unset LDFLAGS
./configure --prefix=/usr/i486-mingw32/ --host=i486-mingw32 --with-msw --with-expat=builtin --with-libpng=builtin --with-zlib=builtin --disable-compat26 --enable-unicode --disable-shared --disable-debug --enable-dataobj --enable-threads --enable-no_rtti --disable-no_exceptions --enable-longlong

  sed -ie 's/wxHAS_STRTOLL/HAVE_WCSTOULL/g' src/common/string.cpp || return 1 #КОСТЫЛЬ №1!
  sed -ie 's/wxStrtoll/wcstoll/g' src/common/string.cpp || return 1 #КОСТЫЛЬ №2!
  sed -ie 's/wxStrtoull/wcstoull/g' src/common/string.cpp || return 1 #КОСТЫЛЬ №3!

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

