pkgname=gtkparasite
pkgver=r90.bfd9f37
pkgrel=1
pkgdesc="GTK inspector."
arch=('i686' 'x86_64')
url="http://chipx86.github.io/gtkparasite/"
license=('MIT')
depends=(gtk3 python2)
source=(git+https://github.com/chipx86/gtkparasite.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  PYTHON=/usr/bin/python2 ./autogen.sh --with-gtk=3.0 --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
