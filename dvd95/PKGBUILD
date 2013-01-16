# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=dvd95
pkgver=1.6p0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A gnome application to convert DVD9 to DVD5"
url="http://dvd95.sourceforge.net/"
license="GPL"
depends=('cairo' 'cdrkit' 'ffmpeg' 'libgnomeui' 'libdvdread' 'mplayer' 'intltool' 'libmpeg2')
makedepends=('gcc' 'make')
optdepends=('vlc: video playback and preview')
source=(http://downloads.sourceforge.net/sourceforge/dvd95/$pkgname-$pkgver.tar.gz)
md5sums=('bc820370cb1b3a95d361654a04a1792c')
sha256sums=('fffa2e45d8f5d9cb9971abd14160b09a7362763fc70b402e016a8876c2c28fea')

build() {
  cd $srcdir/$pkgname-$pkgver

  export LIBS+=" -lxml2"
  ./configure --prefix=/usr

  make || return 1
  make DESTDIR=$pkgdir install
}
# vim:set ts=2 sw=2 et:
