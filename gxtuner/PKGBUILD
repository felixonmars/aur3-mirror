# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gxtuner
pkgver=2.1
pkgrel=1
pkgdesc="A simple, small and lightweight guitar/bass tuner for jack."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/guitarix/"
license=('GPL')
depends=('gtk2' 'zita-resampler' 'fftw' 'jack')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/guitarix/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('c29fdc3a51bc67f602db877d9becf8f5')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
