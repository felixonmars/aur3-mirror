# $Id: PKGBUILD 119714 2014-09-28 20:40:39Z giovanni $
# Maintainer: Matthieu Zimmer<contact@matthieu-zimmer.net>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>

pkgname=ode-r
pkgver=0.13.1
pkgrel=1
pkgdesc="An open source, high performance library for simulating rigid body dynamics in released mode"
arch=('i686' 'x86_64')
url="https://bitbucket.org/odedevs/ode/"
license=('LGPL' 'BSD')
depends=('gcc-libs' 'bash' 'automake' 'make' 'autoconf' 'ode')
source=("https://bitbucket.org/odedevs/ode/downloads/ode-${pkgver}.tar.gz")
md5sums=('00f6613b3d8e5249be60e3a513d6aebd')

build() {
  cd "${srcdir}/ode-${pkgver}"
  
  sed -i 's/ode_/ode_r_/g' ode/src/Makefile.am ode/demo/Makefile.am
  sed -i 's/ode[.]/ode_r./g' ode/src/Makefile.am ode/demo/Makefile.am
  sed -i 's/ode_r[.]cpp/ode.cpp/g' ode/src/Makefile.am ode/demo/Makefile.am
  
  ./bootstrap
  
  ./configure --prefix=/usr/local \
              --enable-shared \
              --enable-libccd \
              --enable-double-precision \
	      --disable-asserts \
	      --program-suffix=-r
  
  make
}

package() {
  cd "${srcdir}/ode-${pkgver}"

  echo "${pkgdir}"
  make DESTDIR=${pkgdir}/ install

}

