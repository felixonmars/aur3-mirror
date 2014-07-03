# Contributor: Tibor Bamhor <tiborb95 at gmail dot com>
# Contributor: Patryk Kowalczyk < patryk at kowalczyk ws>
# Edit for ImageMagick support: Sylvain Brunerie <sylvain.brunerie {at} gmail {dot} com>

pkgname=ale-imagemagick
pkgver=0.8.11.2
pkgrel=1
pkgdesc="Anti-Lamenessing Engine - image enhancement tools (with ImageMagick support). Based on ale package by TiborB."
url="http://auricle.dyndns.org/ALE/"
license="GPL"
arch=('i686' 'x86_64')
depends=('perl-exiftool' 'imagemagick')
source=(http://slackware.org.uk/slacky/slackware-12.2/graphic/ale/0.8.11.2/src/ale-${pkgver}.tar.gz)

md5sums=('1ed83d080a4bf80f88ed78acb5149c26')

build() {
  cd $srcdir/ale-$pkgver
#folowing is to support GC 4.3
# sed -i '/assert.h/a\
#\#include <cstring>' ui/ui.h || exit 0
  ./configure --with-imagemagick=yes
  make || return 1
  make DESTDIR=$pkgdir install

  mkdir -p $pkgdir/usr/bin/
  cp $pkgdir/usr/local/bin/* $pkgdir/usr/bin
  rm -rf $pkgdir/usr/local
}
