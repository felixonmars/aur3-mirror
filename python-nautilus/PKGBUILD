# Maintaner: Giorgio Gilestro <giorgio@gilest.ro>
pkgname=python-nautilus
pkgver=1.1
pkgrel=2
pkgdesc="Python binding for Nautilus components"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/nautilus-python/"
license="GPL"
#makedepends=('pkgconfig' 'gnome-python' )
depends=('nautilus' 'python2-gobject')
optdepends=('python2-gconf: required for open-terminal and background-image examples')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/nautilus-python/${pkgver}/nautilus-python-${pkgver}.tar.bz2)
sha256sums=('c5144e01ce09a6d4227cb9156973f9b955367fb2af423c3416ce76d9f1df95a9')
build() {
  export PYTHON=python2
  cd "$srcdir/nautilus-python-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/nautilus-python-$pkgver"
  make DESTDIR="$pkgdir" install
}
