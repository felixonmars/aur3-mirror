# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: Corrado 'bardo' Primier <corrado.primiermail.polimi.it>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=beast
pkgver=0.9.0
pkgrel=1
pkgdesc="A music composition and modular synthesis application"
arch=('i686' 'x86_64')
url="http://beast.testbit.eu/"
license=('GPL' 'LGPL')
depends=('alsa-lib' 'flac' 'guile1.8' 'libgnomecanvas' 'libmad'
         'libvorbis' 'rapicorn' 'desktop-file-utils')
provides=("bse-alsa=$pkgname")
conflicts=('bse-alsa')
install="$pkgname.install"
source=("http://dist.testbit.eu/beast/v${pkgver%.*}/beast-$pkgver.tar.bz2")
md5sums=('2b529dc226603acbae17cba01fe8611f')

prepare() {
  cd $pkgname-$pkgver

  # strip uncorrect -Wl parameter
  sed -i 's/AM_LDFLAGS="$AM_LDFLAGS -Wl"/:/' configure

  # use guile 1.8
  sed -i 's/guile-config/&1.8/' configure
}

build() {
  cd $pkgname-$pkgver
  AM_LDFLAGS=" -lrt" ./configure --prefix=/usr
  make V=1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  # rm mime cache
  find "$pkgdir/usr/share/mime" \
    -maxdepth 1 -type f -exec rm {} \;
}
