# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=(blepvco)
pkgver=0.1.0
pkgrel=1
pkgdesc="LADSPA plugin library containing three anti-aliased, minBLEP-based, hard-sync-capable oscillator plugins."
arch=('i686' 'x86_64')
url="http://www.smbolton.com/linux.html"
license=('GPL')
depends=('ladspa')
source=(http://www.smbolton.com/linux/$pkgname-$pkgver.tar.gz)
md5sums=('d36dc3227c2d74e2077e07b14c410afd')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  make || return 1

  mkdir -p $pkgdir/usr/lib/ladspa || return 1
  sed "s_\(/usr/lib/ladspa\)_$pkgdir\1_" -i Makefile || return 1

  make DESTDIR=$pkgdir install || return 1
}

