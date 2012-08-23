# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=mingw32-exiv2
_pkgname=exiv2
pkgver=0.23
pkgrel=1
pkgdesc="Exif and Iptc metadata manipulation library and tools."
arch=('i686' 'x86_64')
url="http://exiv2.org"
license=('GPL2')
depends=('mingw32-gcc' 'mingw32-zlib' 'mingw32-expat' 'mingw32-libltdl')
options=('!libtool')
source=("http://www.exiv2.org/${_pkgname}-${pkgver}.tar.gz")

build() {
  unset LDFLAGS
  cd ${srcdir}/${_pkgname}-${pkgver}
  
  export CFLAGS="-O2 -pipe -D_FORTIFY_SOURCE=2"
  export CXXFLAGS="-O2 -pipe -D_FORTIFY_SOURCE=2"
  
  CPPFLAGS="-D_FILE_OFFSET_BITS=64" ./configure --prefix=/usr/i486-mingw32 --build=$CHOST --host=i486-mingw32
  
  # Fix executables extensions
  sed -i 's|BINARY = $(BINSRC:.cpp=)|BINARY = $(BINSRC:.cpp=$(EXEEXT))|;
          s|EXIV2BIN = $(EXIV2MAIN:.cpp=)|EXIV2BIN = $(EXIV2MAIN:.cpp=$(EXEEXT))|;
          s|MCBIN = $(MCMAIN:.cpp=)|MCBIN = $(MCMAIN:.cpp=$(EXEEXT))|;
          s|-o $@ $(LIBRARY) $@.o|-o $@ $(LIBRARY) $(BINOBJ)|
          s|$(BINARY): %: %.o lib|$(BINARY): lib $(BINOBJ)|' src/Makefile
  
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  find ${pkgdir} -name '*.exe' | xargs rm
}
md5sums=('dab67c07bb63a4386d4ea607a8e06eaf')
