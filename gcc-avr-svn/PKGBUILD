# $Id$
# Maintainer: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>

pkgname=gcc-avr-svn
pkgver=185514
pkgrel=1
pkgdesc="The GNU avr Compiler Collection"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'custom')
url="http://gcc.gnu.org/"
makedepends=('subversion')
depends=('binutils-avr>=2.21' 'cloog' 'ppl' 'gcc-libs>=4.6.0' 'libmpc')
provides=('gcc-avr')
conflicts=('gcc-avr')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=()
md5sums=()

_svntrunk=svn://gcc.gnu.org/svn/gcc/trunk/
_svnmod=gcc-avr

build() {
	export CFLAGS="-O2 -pipe"
  	export CXXFLAGS="-O2 -pipe"

  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_svnmod"
  	mkdir build
  	cd build
  	../configure --disable-libssp \
        	--disable-nls \
		--enable-languages=c,c++ \
		--infodir=/usr/share/info \
               	--libdir=/usr/lib \
               	--libexecdir=/usr/lib \
               	--mandir=/usr/share/man \
               	--prefix=/usr \
               	--target=avr \
               	--with-gnu-as \
               	--with-gnu-ld \
               	--with-as=/usr/bin/avr-as \
               	--with-ld=/usr/bin/avr-ld

  	make
}

package() {
  cd "$srcdir/$_svnmod"

  	cd build
  	make -j1 DESTDIR=${pkgdir} install

  	rm -f ${pkgdir}/usr/lib/libiberty.a
  	rm -rf ${pkgdir}/usr/share/man/man7
  	rm -rf ${pkgdir}/usr/share/info
}

