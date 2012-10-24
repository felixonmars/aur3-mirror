# Maintainer: Jakob 'flocke' Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=wma2mp3
pkgver=3
pkgrel=3
pkgdesc="A Perl Script to convert WMA in MP3"
url="http://files.shadowice.org"
license=(GPL)
arch=(x86_64 i686)
depends=('perl-audio-wma' 'perl-mp3-tag' 'ffmpeg' 'perl')
source=("http://git.shadowice.org/scripts.git/plain/convert2mp3/wma2mp3.pl")

build() {
install -D -m 775  "${srcdir}/wma2mp3.pl" ${pkgdir}/usr/bin/wma2mp3
}

md5sums=('4a1a68f19c0c14a80f73c34958eb7b78')
