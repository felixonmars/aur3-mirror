# Contributor: Atlas95 <atlas95@gmail.com>
# Thanks to KAeL
pkgname=bemused-linuxserver
pkgver=1.73
pkgrel=3
pkgdesc="Server to remote control xmms by bluetooth with a compatible mobil phone or symbian based system"
depends=('gcc' 'xmms')
conflict=('bemused-linuxserver')
arch=('i686')
url="http://bemused.sourceforge.net/"
license=('GPL')
source=(http://download.sourceforge.net/bemused/bemusedlinuxserver-1_73.tar.gz bemused.patch)
install=bemused.install
md5sums=('d6f0198771c06ea8a7eb96b6a28acc11' '62b5888fcb43b5eb46b6a8fef683c921')

build() {
  cd $startdir/src/bemusedlinuxserver$pkgver
  patch -Np0 -i ../bemused.patch || return 1
  make || return 1
  mkdir -p $startdir/pkg/etc $startdir/pkg/usr/bin
  make DESTDIR=$startdir/pkg PREFIX=/usr install
  echo "edit /etc/bemused.conf and add bemused to your startup"
}
