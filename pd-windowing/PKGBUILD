# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=pd-windowing
pkgver=0.1
pkgrel=1
pkgdesc="Pd Externals. Provides: hammimng~, hanning~, blackman~, cosine~, connes~, bartlett~, welch~, lanczos~, gaussian~, and kaiser~ "
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/windowing/windowing-$pkgver.tar.gz)
md5sums=('fd62d38f26d6b83525d38862e4263233')

build() {
  cd $srcdir/windowing-$pkgver
  make
}

build() {
  cd $srcdir/windowing-$pkgver
  make DESTDIR=$startdir/pkg install
}
