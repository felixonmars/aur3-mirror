# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=lebiniou
pkgver=3.19.1
pkgrel=1
pkgdesc="A program which creates images from sound, in an intelligent way."
arch=(i686 x86_64)
url="http://biniou.net/"
license=('GPL')
depends=('lebiniou-data' 'glu' 'libcaca' 'fftw' 'ffmpeg'
         'ffmpeg-compat' 'sdl_ttf' 'pnglite')
makedepends=('jack')
optdepends=('jack: jack output plugin')
install="$pkgname.install"
source=("http://dl.biniou.net/biniou/tar/$pkgname-$pkgver.tar.gz")
md5sums=('ed9311275121f8c3e63b158bb444caee')

prepare() {
  cd $pkgname-$pkgver

  # do not fail on warnings
  sed -i 's/ -Wall -Werror//' configure

  # right freetype header path
  sed -i '/include/s/freetype/&2/' plugins/stable/output/GL/ttf_gl.c

  # right FreeMono font path
  sed -i 's/truetype\/freefont/TTF/' src/constants.h
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-opengl \
              --enable-sndfile \
              --enable-twip \
              --enable-caca \
              --enable-diskwriter \
              --enable-erlang \
              --enable-webcam
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
