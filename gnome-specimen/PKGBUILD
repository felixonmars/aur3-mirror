# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: neodreams <yanbrodeur@videotron.ca>

pkgname=gnome-specimen
pkgver=0.4
pkgrel=5
pkgdesc="A simple tool to view and compare fonts installed on your system."
arch=('any')
url="http://uwstopia.nl/"
license=('GPL')
depends=('gnome-python' 'hicolor-icon-theme')
makedepends=('intltool')
install="$pkgname.install"
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('c1af774ee4ab5bd1289699b4094368b3')
sha256sums=('353ef10e647e5d06354dd827a4152a8cb45bf56b2f1c72e449a41e5175880424')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export PYTHON="/usr/bin/python2"

  # GtkSpinButton fix
  sed -i "s_1\(0<\)_\1_" data/$pkgname.glade

  ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--with-gconf-schema-file-dir=/usr/share/gconf/schemas

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
