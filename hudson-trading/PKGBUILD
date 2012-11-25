# Maintainer:  <ying@althonx4>
pkgname=hudson-trading  
_pkgname=Hudson  
pkgver=0_10
pkgrel=2 
pkgdesc="Hudson is a free, open-source trading simulator based on EOD price historical data. It is designed as a C++ library providing simulation and statistics tools for integration with other trading strategy applications. A set of strategy examples is included in the source code distribution to illustrate some of the features provided."
url="http://code.google.com/p/hudson"
arch=('i686' 'x86_64')
license=('GPL')
depends=('boost' 'ta-lib')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://hudson.googlecode.com/files/Hudson_0_10_src_db.tar.gz)
md5sums=('d33cfee50ec78ade6149d0ed7f39d6a0')

build() {
  cd $startdir/src/lib
  src=Makefile
  sed -e 's@hudson.a@hudson.so@g; s/ar r.*$//; s/ranlib .*$/g++ -o $@ --shared $^/; s@opt/local@usr@g; s@CFLAGS=@CFLAGS=-fPIC @g;' $src > .tmp;  mv .tmp $src
  src=StrategyTrader.cpp
  sed -e 's@const exception@const std::exception@g; ' $src > .tmp;  mv .tmp $src

  make -j4 || return 1

  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include/hudson
  cp libhudson.so $pkgdir/usr/lib
	cp *.h *hpp $pkgdir/usr/include/hudson
		 

  app
}

app() {
  cd $srcdir/app
  for f in `find . -name "Makefile"`
  do
    sed -e 's/ta_common -lta_func/ta_lib/g; s@opt/local@usr@g; s@hudson.a@hudson.so@' $f > .tmp
    mv .tmp $f
  done
	src=JanTrader/jan.cpp
	sed -e 's/#include <Database.hpp>/#include <Database.hpp>\n#include <Report.hpp>\n/;' ${src} > .tmp
	mv .tmp ${src}
  cd $srcdir
}
