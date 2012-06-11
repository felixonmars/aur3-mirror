# Maintainer: Ferdinand H. < ferdinandhzr at aol dot com >

pkgname=opencde
pkgver=620
pkgrel=4
pkgdesc="OpenCDE is a free implementation of the Open Group's Common Desktop Environment."
arch=('i686' 'x86_64')
url='http://devio.us/~kpedersen/index.php'
license=('BSD')
depends=('openmotif')
source=("http://devio.us/~kpedersen/releases/${pkgname}-${pkgver}.tar.gz" 
"opencde.h.patch")
md5sums=('b9558b0366c9ed4ca8449abb40b060d3'
         'ea4cff2c99656aedb7090592ce7e5a5e')


build() {
  cd ${pkgname}/src

  # fix build errors
  unset CFLAGS CXXFLAGS LDFLAGS

## apply patch from highvoltage ;) | note: directory style like brainfuck...

  cd ../src/libopencde/include/
  patch -p0 < ../../../../../opencde.h.patch
  cd ../../

##  sed -i "s_PREFIX=/usr/local_PREFIX=${pkgdir}/usr_" config.Mk
##  sed -i "s_PREFIX=/usr/local_PREFIX=/usr_" config.Mk

##  sed -i 's/$(CC) -c $(CPPFLAGS) $< -o $@/$(CC) -fPIC -c $(CPPFLAGS) $< -o $@/' motifmm/Makefile
  sed -i "s_-lmotifmm_-lmotifmm -lXm -lXt -lX11_" dtpanel/Makefile

# build it for linux instead of freebsd
  make PLATFORM=LINUX
}

package() {
  cd ${pkgname}

  # installing it is better than wild copy games
  make PREFIX=${pkgdir}/usr install

  #install -d ${pkgdir}/usr
  #cp -r bin share etc lib ${pkgdir}/usr
}
