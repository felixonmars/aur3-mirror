# Maintainer: TDY <tdy@archlinux.info>

pkgname=python-pymedia
pkgver=1.3.7.3
pkgrel=1
pkgdesc="A Python library for accessing and manipulating multimedia files"
arch=('i686' 'x86_64')
url="http://pymedia.org/"
license=('LGPL')
depends=('alsa-lib' 'ffmpeg' 'python2')
optdepends=('faad2:     AAC support'
            'lame:      MP3 support'
            'libogg:    Ogg support'
            'libvorbis: Vorbis support')
source=(http://downloads.sourceforge.net/${pkgname/*-}/${pkgname/*-}-$pkgver.tar.gz
        ${pkgname/*-}-$pkgver-amd64-gentoo.diff)
md5sums=('2f4930c63866c97af5090b176e2a118a'
         '3137e65e1208db98e404ee894fcd744a')

build() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  patch -Np1 -i ../${pkgname/*-}-$pkgver-amd64-gentoo.diff
  sed -i '1i\#include <stdint.h>' video/{muxer/{,de}muxer,vcodec/vcodec}.c
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
