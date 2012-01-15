# Maintainer: Ian Yang <doit.ian@gmail.com>
pkgname=google-glog
pkgver=0.3.2
pkgrel=0
pkgdesc="Logging library for C++"
arch=(i686 x86_64)
license=('BSD3')
url="http://code.google.com/p/google-glog/"
depends=('gcc-libs')
makedepends=('make' 'gcc')
options=('!libtool')
source=(http://google-glog.googlecode.com/files/glog-${pkgver}.tar.gz)
md5sums=('897fbff90d91ea2b6d6e78c8cea641cc')

build() {
  cd ${startdir}/src/glog-${pkgver}

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Lazy way of dealing with conflicting man and info pages...
  rm -rf ${pkgdir}/usr/share
}
