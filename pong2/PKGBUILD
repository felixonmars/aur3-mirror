# Maintainer: Johannes Jordan (fopref) <fopref@lanrules.de>
# Contributor: Alexander Mieland (dma147) <dma147@linux-stats.org>

pkgname=pong2
pkgver=0.1.3
pkgrel=2
pkgdesc="Networked, 3D clone of pong"
url="http://pong2.berlios.de/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgl' 'openssl' 'sdl_image')
source=(http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz \
	pong2.desktop)
url="http://pong2.berlios.de/"
md5sums=('3c09cbcefcfdaa00af1a76c49572626c' '28167ea1175ffcf297583c29f7df66a1')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  install -D -m644 $startdir/src/$pkgname-$pkgver/icon.png $startdir/pkg/usr/share/pixmaps/pong2.png
  install -D -m644 $startdir/pong2.desktop $startdir/pkg/usr/share/applications/Pong2.desktop
}
