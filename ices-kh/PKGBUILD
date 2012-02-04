# Maintainer: Sebastien Luttringer <seblu+arch@seblu.net>

pkgname=ices-kh
pkgver=2.0_kh60a
pkgrel=1
pkgdesc='KH branche extends the offical release of Ices 2.0.1. This includes JACK input support, save file splitting and multiple input switchover.'
arch=('i686' 'x86_64')
url='http://www.xiphicecast.webspace.virginmedia.com'
license=('GPL2')
depends=('alsa-lib' 'jack' 'libvorbis' 'libshout' 'libvorbis' 'libogg' 'libxml2' 'speex' 'zlib' 'libtheora')
conflict=('ices' 'ices2')
source=("http://www.xiphicecast.webspace.virginmedia.com/ices-2.0-kh60a.tar.bz2") 
md5sums=('b09e6132cf1f9f4b5312680f4a495578')

build() {
  cd ${pkgname/-*}-${pkgver//_/-}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname/-*}-${pkgver//_/-}
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 ft=sh et:
