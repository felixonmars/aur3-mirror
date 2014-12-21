# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>
pkgname=gap-ati
pkgver=1.0
pkgrel=1
pkgdesc="Program which gets/sets the power level on ATI cards via "aticonfig" program"
arch=(i686 x86_64)
url="http://lnet.wordpress.com/"
license=('GPL3')
groups=('')
provides=('')
depends=('catalyst-utils' 'gtk2')
makedepends=('gtk2')
source=(http://members.chello.sk/ales/gap-$pkgver.tar.gz)
md5sums=('50014779fbbd0e31639d98b5a946513f')

build() {
  cd $startdir/src/gap-$pkgver
  ./configure --prefix=/usr 
  make || return 1
  make prefix=$startdir/pkg/usr install
}

