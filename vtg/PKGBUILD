# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>
pkgname=vtg
pkgver=0.12.0
pkgrel=1
pkgdesc="Vala Toys for gEdit is an experimental collection of plugins that extends the gEdit editor to make it a better developer editor."
arch=('i686' 'x86_64')
url="http://vtg.googlecode.com/"
license=('GPL2' 'LGPLv2.1')
depends=('glib2>=2.12.0' 'gtk3' 'gedit>=3.0.0' 'vala>=0.12.0' 'gnome-common')
makedepends=('gettext')
provides=('libafrodite')
conflicts=('vtg-devel')
options=('!libtool')
install=vtg.install
source=(http://vtg.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
sha256sums=('e46f85b03967ea0ccd088235698d3b14ee22066d7a999486cc3d20d2611af205')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make CFLAGS="-g -O2 -fPIC"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
