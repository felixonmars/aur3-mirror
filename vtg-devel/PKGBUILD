# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>
pkgname=vtg-devel
pkgver=0.11.1
pkgrel=1
pkgdesc="Vala Toys for gEdit is an experimental collection of plugins that extends the gEdit editor to make it a better developer editor."
arch=('i686' 'x86_64')
url="http://vtg.googlecode.com/"
license=('GPL2' 'LGPLv2.1')
depends=('glib2>=2.12.0' 'gtk2>=2.18.0' 'gedit>=2.28.0' 'vala-git' 'gnome-common')
makedepends=('gettext')
provides=('libafrodite')
conflicts=('vtg')
options=('!libtool')
source=(http://vtg.googlecode.com/files/vtg-$pkgver.tar.bz2)
sha256sums=('44cfffa47be0ea637987ea313785cc479cf6e306896e4424e3068468e5a9d467')

build() {
  cd "$srcdir/vtg-$pkgver"

  ./configure --prefix=/usr
  make CFLAGS="-g -O2 -fPIC"
}

package() {
  cd "$srcdir/vtg-$pkgver"

  make DESTDIR="$pkgdir/" install
}

