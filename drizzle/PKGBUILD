# Maintainer: Emil Renner Berthing <esmil@mailme.dk>

pkgname=drizzle
eval "pkgname=('drizzle' 'libdrizzle')" # hack to fool AUR
pkgbase=drizzle
pkgver=2011.03.11
pkgrel=1
arch=('i686' 'x86_64')
url="http://drizzle.org/"
license=('GPL')
makedepends=('protobuf' 'boost')
source=(http://launchpad.net/drizzle/elliott/2011-02-28/+download/drizzle7-$pkgver.tar.gz)
sha1sums=('1941f0037f2e93bc2cb766f9facfce11b1c4926f')

build() {
  cd "$srcdir/drizzle7-$pkgver"
  PYTHON=python2 ./configure --prefix=/usr
  sed -ie 's/python /python2 /g' Makefile
  make
}

package_drizzle() {
  pkgdesc="A lightweight SQL database for Cloud and Web"
  depends=('protobuf' 'boost' 'libdrizzle')

  cd "$srcdir/drizzle7-$pkgver"
  make DESTDIR="$pkgdir/" install

  cd "$pkgdir"
  mkdir -p ../tmp/{include,lib/pkgconfig}

  mv usr/include/libdrizzle ../tmp/include
  mv usr/lib/libdrizzle.* ../tmp/lib
  mv usr/lib/pkgconfig/libdrizzle.pc ../tmp/lib/pkgconfig
}

package_libdrizzle() {
  eval "pkgdesc='A C library to query Drizzle and other MySQL-related databases'" # hack to fool AUR
  depends=('glibc')

  cd "$pkgdir"
  mv ../tmp usr
}
