# Contirbutor : wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor : kozaki <kozaki>

pkgname=tuxrip
pkgver=0.99beta6
pkgrel=2
pkgdesc="Bash script for ripping and encoding DVD titles in mpeg4 format"
arch=i686
url="http://tuxrip.free.fr"
license="GPL"
depends=('bc' 'libdvdread' 'libogg' 'libvorbis' 'mplayer' 'ogmtools' \
         'transcode' 'libdvdcss' 'mkvtoolnix' 'vorbis-tools')
install=tuxrip.install
source=(http://tuxrip.free.fr/tuxrip/${pkgname}099beta6.tar.bz2)
md5sums=('9c2b89e74e0765aab244278be22f0f9d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -e 's|/usr/bin/install|/bin/install|' \
      -i Makefile

  make DESTDIR=$startdir/pkg install
  chmod 644 $startdir/pkg/usr/share/tuxrip/* \
            $startdir/pkg/usr/share/tuxrip/lang/*
  chmod 755 $startdir/pkg/usr/share/tuxrip/lang/
}
