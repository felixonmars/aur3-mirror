# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=seahorse-nautilus
pkgver=3.3.1
pkgrel=1
pkgdesc="PGP encryption and signing for nautilus"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/seahorse-nautilus/"
license=('GPL')
depends=('gconf' 'nautilus' 'libcryptui')
makedepends=('intltool')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/3.3/$pkgname-$pkgver.tar.xz)
sha256sums=('f022489ad3b3a426b4894e5ac5d90f673f25696f2afcde7ffcdb06389fbe1da9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
