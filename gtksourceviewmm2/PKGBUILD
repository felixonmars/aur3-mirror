# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=gtksourceviewmm2
pkgver=2.10.3
pkgrel=1
pkgdesc="A C++ wrapper for the gtksourceview widget library"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/gtksourceviewmm/"
license=('LGPL')
depends=('gtksourceview2' 'gtkmm')
options=(!libtool)
source=(http://ftp.gnome.org/pub/GNOME/sources/gtksourceviewmm/2.10/gtksourceviewmm-$pkgver.tar.xz)
md5sums=('89d75c441ceeb071943acad1fe48d973')

build() {
  cd "$srcdir/gtksourceviewmm-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/gtksourceviewmm-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/gtksourceviewmm-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
