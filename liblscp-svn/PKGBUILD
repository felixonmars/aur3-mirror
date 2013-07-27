# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Peter Crighton <petecrighton@googlemail.com>

pkgname=liblscp-svn
pkgver=0.5.6.5.2459
pkgrel=1
pkgdesc="LinuxSampler Control Protocol (LSCP) wrapper library"
arch=('i686' 'x86_64')
url="http://www.linuxsampler.org/"
license=('LGPL')
depends=('glibc')
makedepends=('subversion' 'doxygen' 'libtool')
conflicts=('liblscp')
provides=('liblscp')
options=('!libtool')
source=("$pkgname::svn+https://svn.linuxsampler.org/svn/liblscp/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(sed -n 's/AM_INIT_AUTOMAKE.*, \(.*\))/\1/p' configure.ac).$(svnversion)
}

build() {
  cd "$srcdir/$pkgname"
  make -f Makefile.svn
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}