# Maintainer: 
# Contributor: Alexander Mieland (dma147) <dma147@linux-stats.org>

pkgname=chartsd
pkgver=0.6
pkgrel=1
pkgdesc="Generates 2D line diagrams from log files"
arch=('i686' 'x86_64')
url="http://chartsd.berlios.de"
license=('GPL2')
depends=('gd' 'confuse')
backup=(usr/share/chartsd/{temp.cpu.conf,temp.mb.conf,temp.hda.conf,used.swap.conf,cpu.load.conf,temp.hdb.conf})
source=(http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('a4b440049b1587988d39cd01f8f56b03')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make prefix="$pkgdir"/usr/ install
}
