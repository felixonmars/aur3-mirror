pkgname='gearmand'
pkgver='0.28'
pkgrel='1'
pkgdesc='Gearman is an application framework designed to distribute appropriate computer tasks to multiple computers.'
arch=('i686' 'x86_64')
url="http://gearman.org/"
license=('Simplified BSD License')
makedepends=('boost>=1.39.0')
optdepends=()
depends=('boost-libs>=1.39.0')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://launchpad.net/gearmand/trunk/$pkgver/+download/gearmand-$pkgver.tar.gz")
md5sums=('43fc281297489a53d4ee081e33c728db')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

