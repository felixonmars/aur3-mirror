# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=(permafrost)
pkgver=0.2.0
pkgrel=1
pkgdesc="NASPRO (recursive acronym for NASPRO Architecture for Sound PROcessing). Permafrost: a DSP language designed with physics-based modeling in mind."
arch=('i686' 'x86_64')
url="http://naspro.atheme.org/"
license=('GPL')
groups=('naspro')
makedepends=('cmake')
source=("http://download.sourceforge.net/project/naspro/naspro/0.2.0/$pkgname-$pkgver.tar.gz")
md5sums=('0aa7d8110cb816f2efcc5b10f5192b57')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

