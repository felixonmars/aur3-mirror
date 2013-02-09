# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Ian Yang <doit.ian@gmail.com>
pkgname=lib32-google-glog
pkgver=0.3.3
pkgrel=1
pkgdesc="Logging library for C++ (32-bit)"
arch=(x86_64)
license=('BSD3')
url="http://code.google.com/p/google-glog/"
depends=('lib32-gcc-libs' 'lib32-google-gflags' 'google-glog')
makedepends=('make' 'gcc-multilib')
options=('!libtool')
source=(http://google-glog.googlecode.com/files/glog-${pkgver}.tar.gz)
md5sums=('a6fd2c22f8996846e34c763422717c18')

build() {
  cd ${startdir}/src/glog-${pkgver}

  export CFLAGS="-m32"
  export CXXFLAGS="-m32"

  ./configure --prefix=/usr --libdir=/usr/lib32 || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Lazy way of dealing with conflicting man and info pages...
  rm -rf ${pkgdir}/usr/share
}

package() {
    cd "$srcdir/glog-$pkgver"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/include"
    rm -r "$pkgdir/usr/share"
}
