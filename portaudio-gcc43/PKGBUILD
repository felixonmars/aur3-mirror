# Based on 'portaudio' package - Eric Belanger <eric@archlinux.org>
# Last/Most-Recent Contributor: Darwin Bautista <djclue917@gmail.com>
# Maintainer: Joe Amenta <amentajo@msu.edu>
# Original Maintainer: Bob Finch <w9ya@qrparci.net>

_pkgname=portaudio
pkgname=${_pkgname}-gcc43
pkgver=19_20071207
pkgrel=2
pkgdesc="A free, cross-platform, open source, audio I/O library"
url="http://www.portaudio.com/"
source=(http://www.portaudio.com/archives/pa_stable_v$pkgver.tar.gz)
depends=('jack-audio-connection-kit')
makedepends=('gcc43')
provides=("{_pkgname}=${pkgver}-${pkgrel}")
conflicts=("{_pkgname}")
options=(!libtool)
arch=('i686' 'x86_64')
license=('custom')
md5sums=('d2943e4469834b25afe62cc51adc025f')

build() {
  cd $startdir/src/${_pkgname}
  ./configure --prefix=/usr CC=gcc-4.3 CXX=g++-4.3
  make || return 1
  make DESTDIR=$startdir/pkg install
  
  install -D -m644 LICENSE.txt $startdir/pkg/usr/share/licenses/${_pkgname}/LICENSE.txt
}
