# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkgname=gnome-specimen
pkgname=$_pkgname-light
pkgver=0.4
pkgrel=2
pkgdesc="A simple tool to view and compare fonts installed on your system. Light version."
arch=(any)
url="http://uwstopia.nl/"
license=('GPL')
depends=('python2-gconf' 'hicolor-icon-theme')
makedepends=('intltool')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz")
md5sums=('c1af774ee4ab5bd1289699b4094368b3')
sha256sums=('353ef10e647e5d06354dd827a4152a8cb45bf56b2f1c72e449a41e5175880424')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  export PYTHON="/usr/bin/python2"

  # Removing unneeded gnome code
  sed -i "41,45d;59,60d" specimen/main.py

  # GtkSpinButton fix
  sed -i "s_1\(0<\)_\1_" data/$_pkgname.glade

  ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--with-gconf-schema-file-dir=/usr/share/gconf/schemas

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
