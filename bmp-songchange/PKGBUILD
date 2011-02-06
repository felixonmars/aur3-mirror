# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=bmp-songchange
pkgver=0.0.2
pkgrel=1
pkgdesc="This plugin allows you to execute custom command on every BMP song\
 change. It was based on XMMS song_change plugin."
arch=(i686 x86_64)
url="http://bmp-plugins.berlios.de/novelian/project.php?p=bmp-songchange"
license=('GPL-2')
depends=('bmp')
source=(http://download.berlios.de/bmp-plugins/$pkgname-$pkgver.tar.gz)
md5sums=('67803fb528adbc5082229dd6cc5eddfb')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
