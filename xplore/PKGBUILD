# Maintainer: TDY <tdy@archlinux.info>

pkgname=xplore
pkgver=1.2a
pkgrel=1
pkgdesc="A powerful and highly configurable Motif file manager"
arch=('i686' 'x86_64')
url="http://www.musikwissenschaft.uni-mainz.de/~ag/xplore/"
license=('GPL')
depends=('libxmu' 'libxpm' 'openmotif')
makedepends=('imake')
options=('!emptydirs')
source=(http://www.musikwissenschaft.uni-mainz.de/~ag/$pkgname/$pkgname-$pkgver.tar.bz2
        $pkgname-$pkgver.diff)
md5sums=('129e90bec30a6197bc315eb75e130b1f'
         '2232ff7c1ce3883d63c6743b77b5d189')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.diff
  xmkmf -a
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
