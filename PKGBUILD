# Maintainer: Testuser_01 <arch@nico-siebler.de>
# Contributor: Testuser_01 <arch@nico-siebler.de>
pkgname='fastoggenc'
pkgver=0.1.4
pkgrel=1
pkgdesc="fastoggenc is a free software python script (GPL v3) which converts mp3, m4a, wma, wav and other audio formats into ogg-vorbis format. It is a fork from dir2ogg script that was previously insipred by the perl script mp32ogg. Due to parallel encoding processes which can be seen as sort of multithreading, it's very fast in encoding several files when owning a multicore processor."
arch=('any')
url='http://www.tuxamito.com/joomla/index.php/en/component/content/article/46-fastoggenc/86-fastoggenc'
depends=(mplayer mpg123 lame flac faad2 vorbis-tools wavpack musepack-tools cdparanoia cdrkit)
license=('GPLv3')
source=("http://software.tuxamito.com/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('db8576f9d49741680c06a23940a38885')

build() {
  mkdir -p "${pkgdir}/usr/bin/" || return 1
  sed -e 's@#!/usr/bin/python@#!/usr/bin/python2@' -i "fastoggenc/fastoggenc" || return 1
  install -m755 -D "fastoggenc/fastoggenc" "${pkgdir}/usr/bin/" || return 1
}

