# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=vdr-yacoto
pkgver=0.2.1
pkgrel=1
pkgdesc="VDR plugin, Yet another convert tool (for VDR)"
arch=('i686' 'x86_64')
url="http://www.htpc-forum.de/"
license=('GPL')
depends=('gcc' 'vdr' 'replex-yacoto' 'vdrsync' 'lame' 'mencoder' 'vorbis-tools' 'ffmpeg' 'screen' 'dvdauthor' 'cdrkit' 'gpac' 'vamps' 'imagemagick' 'hlcut')
optdepends=('vdr-bgprocess')
install=$pkgname.install
source=(http://www.htpc-forum.de/download/download.php?id=25 \
http://www.htpc-forum.de/download/download.php?id=26)
md5sums=()

build() {
  cd "$srcdir/yacoto-$pkgver" || return 1
  
  make VDRDIR="/usr/src/VDR"  LIBDIR="." all || return 1
  
  mkdir -p $pkgdir/usr/lib/vdr/ || return 1
  cp libvdr-*.so.* $pkgdir/usr/lib/vdr/ || return 1
  
  mkdir -p $pkgdir/etc/vdr/plugins || return 1
  cp -r $srcdir/yacoto $pkgdir/etc/vdr/plugins || return 1

  mkdir -p $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r README $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r README.en $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r COPYING $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r HISTORY $pkgdir/usr/share/doc/$pkgname || return 1
  cp -r TODO $pkgdir/usr/share/doc/$pkgname || return 1
}
