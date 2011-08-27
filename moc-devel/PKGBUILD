# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>

pkgname=moc-devel
pkgver=2.5.0
_pkgver=alpha4
pkgrel=3
pkgdesc="A powerful & easy to use console audio player."
arch=('i686' 'x86_64')
url="http://moc.daper.net/"
license=('GPL')
depends=('alsa-lib' 'curl' 'flac' 'libid3tag'  'libmad' 'libvorbis')
makedepends=('pkgconfig')
optdepends=('wavpack')
provides=('moc')
conflicts=('moc')
options=(!libtool)
source=(ftp://ftp.daper.net/pub/soft/moc/unstable/moc-$pkgver-$_pkgver.tar.bz2)

md5sums=('2dd0cb6481d77fda09c58ec3154a21c0')

build() {
  cd ${srcdir}/moc-$pkgver-$_pkgver

  ./configure --prefix=/usr \
  	--without-jack --without-rcc \
	--without-aac --without-musepack \
	--without-sndfile --without-modplug \
	--without-timidity --without-sidplay2 \
	--without-ffmpeg --without-speex \
	--without-samplerate
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
