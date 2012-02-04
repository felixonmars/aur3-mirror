# Contributor: SiD/sidious <miste78@web.de>
pkgname=mplayer-skin-proton
pkgver=1.2
pkgrel=2
pkgdesc="Additional Skin for MPlayer"
arch=('i686' 'x86_64')
depends=('mplayer-x')
license=('unknown')
url="http://www.mplayerhq.hu/"

source=(ftp://ftp.mplayerhq.hu/MPlayer/skins/proton-$pkgver.tar.bz2)
	
build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/mplayer/skins
  mv $startdir/src/proton  $startdir/pkg/usr/share/mplayer/skins/
}

md5sums=('22d62dad07c3fba0fdf5520598a4e353')
