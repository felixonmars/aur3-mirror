# Maintainer: prash <prash.n.rao@gmail.com>
pkgname=imskpe
pkgver=1.0.4
pkgrel=1
pkgdesc="IMS Klatt Parameter Editor: formant synthesis GUI in GTK2"
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/imskpe/"
license=('GPL')
depends=( 'gtk2' )
source=("http://downloads.sourceforge.net/project/imskpe/imskpe/imskpe-1.0.4/imskpe-1.0.4.tar.gz")
md5sums=('87c1ed9a809c0f3b4fafb2cefa1f1f2d')

build() {
  cd $srcdir/$pkgname-$pkgver/
  export LDFLAGS="-lm "
  export CFLAGS="-march=native -mtune=native -O3"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
