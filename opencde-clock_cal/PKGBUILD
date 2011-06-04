# Maintainer: Ryan Aghdam <ryan@aghdam.org>

# Based on original package from Thomas Dziedzic.

pkgname=opencde-clock_cal
pkgver=0.4.4
pkgrel=1
pkgdesc="OpenCDE is a free implementation of the Open Group's Common Desktop Environment. Includes a patch for clock and calendar widgets."
arch=('i686' 'x86_64')
url='http://devio.us/~kpedersen/index.php'
license=('BSD')
depends=('openmotif')
source=("http://devio.us/~kpedersen/releases/opencde-${pkgver}.tar.gz" "https://github.com/ryanaghdam/aur-opencde-clockpatch/raw/master/opencde-0.4.4_timers_clock_cal.patch")
md5sums=('bb229c55876aac3f95f7426c61b5b3cd'
         'd3808806a6443802c40131c8cabc9fb5')

build() {
  cd ${pkgname}/src
  cd ../
  patch -p0 < ../opencde-0.4.4_timers_clock_cal.patch
  cd src

  # fix build errors
  unset CFLAGS CXXFLAGS LDFLAGS

  #sed -i "s_PREFIX=/usr/local_PREFIX=${pkgdir}/usr_" config.Mk
  sed -i "s_PREFIX=/usr/local_PREFIX=/usr_" config.Mk

  sed -i 's/$(CC) -c $(CPPFLAGS) $< -o $@/$(CC) -fPIC -c $(CPPFLAGS) $< -o $@/' motifmm/Makefile

  make
}

package() {
  cd ${pkgname}

  # probably need to submit patch to upstream
  #install -d ${pkgdir}/usr/bin

  # removed in 0.4.1 again...
  #make install

  install -d ${pkgdir}/usr
  cp -r bin share etc lib ${pkgdir}/usr
}
