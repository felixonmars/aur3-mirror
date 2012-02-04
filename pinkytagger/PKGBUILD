# Maintainer: Max Fehrm max.fehrm@gmail.com

pkgname=pinkytagger
pkgver=2.1
pkgrel=1
pkgdesc="The old MusicBrainz tagger for Linux"
url="http://pinkytagger.sf.net"
license="GPL"
depends=(ffmpeg qt taglib libofa libmusicbrainz3)
makedepends=(cmake make patch)
optdepends=("lame: to replace ffmpeg, but it is slower.")
arch=(i686)
install=
source=("http://downloads.sourceforge.net/sourceforge/pinkytagger/$pkgname-$pkgver-0.tar.gz" comparetest.patch)
md5sums=(b88f03fd37278366dac4e2979a8143b6 02b06d838beac26446a9c9c5e98f20d0)

build() {
  cd $startdir/src/"$pkgname-$pkgver-0"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DHAVE_LIBMUSICBRAINZ_DEV:bool=false .|| return 1
  patch -p1 <../comparetest.patch || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

