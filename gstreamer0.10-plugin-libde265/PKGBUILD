# Maintainer: maz-1 < loveayawaka at gmail dot com> 

pkgname=gstreamer0.10-plugin-libde265
_gitname=gstreamer0.10-libde265
pkgver=0.1.11
pkgrel=1
pkgdesc="Libde265 plugin (an open h.265 video codec implementation) for gstreamer 0.1."
arch=('i686' 'x86_64')
url="https://github.com/strukturag/gstreamer-libde265"
license=('LGPL3')
depends=("libde265" "gstreamer0.10" "gstreamer0.10-bad" "gstreamer0.10-base" "gstreamer0.10-good" "zlib" "bzip2")
makedepends=( 'git')
source=( "https://codeload.github.com/strukturag/gstreamer-libde265/zip/v${pkgver}"
		"git://anongit.freedesktop.org/gstreamer/common")
md5sums=('c0f5f3306dfabffb4742bf6432b680e1'
		'SKIP')


build() {
  cd gstreamer-libde265-${pkgver}
  cp -r ${srcdir}/common ./
  ./autogen.sh
  ./configure --prefix=/usr  --enable-gstreamer0.10
  make
}


package() {
  cd gstreamer-libde265-${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -f $pkgdir/usr/bin/*
}

