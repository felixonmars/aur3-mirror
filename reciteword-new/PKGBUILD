#Contributor:figo.zhang <figo1802@gmail.com>

pkgname=reciteword-new
pkgver=0.8.4
pkgrel=1
pkgdesc="a education software to help people to study English, with alsa"
arch=('i686' 'x86_64')
url="http://reciteword.cosoft.org.cn"
license=('GPL')
makedepends=()
depends=()
conflicts=()
provides=('reciteword')

source=(http://downloads.sourceforge.net/reciteword/reciteword-$pkgver.tar.bz2 reciteword-alsa.patch fix.patch)
md5sums=('09fb54601d29c30d3c73ad93fe49399d' 'f89ea626d60a703afee46e06d6d7529c' 'f66ab207dff54bd34dbc73bbace4c10f')


build() {
  cd $startdir/src/reciteword-$pkgver
  patch -p1 -i ../reciteword-alsa.patch || return 1
  patch -p1 -i ../fix.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}


