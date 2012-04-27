# Maintainer: snyh<snyh@snyh.org>
pkgname=distcc-rsp
pkgver=3.2rc1
pkgrel=1
epoch=
pkgdesc="a fast, free distributed C/C++ compiler (with response file patch)"
arch=(i686)
url="http://code.google.com/p/distcc"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('distcc')
replaces=()
backup=()
options=()
install=
changelog=
source=(http://distcc.googlecode.com/files/distcc-$pkgver.tar.gz 
rsp.patch
distccd1
distccd2)
noextract=()
md5sums=('383c302a6d36dc9865943e0e76f9c527'
'25b6f01bfbe8ff2620fb182041c1b006'
'1c918474372c09304772c20c4de484fa'
'89aaf6e9072092e283465a14e83f0f94')

build() {
  cd "$srcdir/distcc-$pkgver"
  patch -p0 < ../rsp.patch
  ./configure --prefix=/usr --sysconfdir=/etc --disable-Werror
  make
}

package() {
  cd "$srcdir/distcc-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -D -m755 ../distccd1 $pkgdir/etc/rc.d/distccd
  install -D -m644 ../distccd2 $pkgdir/etc/conf.d/distccd
  mkdir -p $pkgdir/usr/lib/distcc/bin
  ln -sv /usr/bin/distcc $pkgdir/usr/lib/distcc/bin/cc
  ln -sv /usr/bin/distcc $pkgdir/usr/lib/distcc/bin/cpp
  ln -sv /usr/bin/distcc $pkgdir/usr/lib/distcc/bin/g++
  ln -sv /usr/bin/distcc $pkgdir/usr/lib/distcc/bin/gcc
}

# vim:set ts=2 sw=2 et:
