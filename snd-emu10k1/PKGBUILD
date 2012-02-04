# Contributor: hasundue
pkgname=snd-emu10k1
pkgver=1.0.23
pkgrel=2
pkgdesc="ALSA driver with emu10k1 support"
arch=('i686' 'x86_64')
url="http://www.alsa-project.org/main/index.php/Main_Page"
license=('GPL')
depends=('')
install=snd-emu10k1.install
source=("ftp://ftp.alsa-project.org/pub/driver/alsa-driver-$pkgver.tar.bz2"
        "Makefile")
md5sums=('4be102f995bd4cc68e6e8178b0d19ec2'
         '8535a72eb93fb368c3249a91b1d3847e')

build() {
  cp "$startdir/Makefile" "$startdir/src/alsa-driver-$pkgver/include"

  cd "$startdir/src/alsa-driver-$pkgver"

  ./configure --with-kernel=/usr/src/linux-2.6.34-ARCH --with-cards=emu10k1,usb-audio --with-sequencer=yes || return 1
  make || return 1
  make DESTDIR="$startdir/pkg" install || return 1
  cd -
}
