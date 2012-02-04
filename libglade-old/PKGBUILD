# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=libglade
pkgname=$_pkg-old
pkgver=0.17
pkgrel=2
pkgdesc="Allows you to load glade interface files in a program at runtime. Older version"
arch=(i686 x86_64)
url="http://ftp.gnome.org/pub/GNOME/sources/libglade/0.17/"
license=('GPL')
depends=('python2' 'gtk' 'libxml')
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/$_pkg/$pkgver/$_pkg-$pkgver.tar.gz")
md5sums=('38b2e2cfd813783fe157617813bfe3b3')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  # python2 fixes
  sed -i "s|python|&2|" libglade-xgettext

  # solves the underquoted definition warning
  sed -i "s|\(AC_DEFUN(\)\(AM_PATH_LIBGLADE\)|\1[\2]|" $_pkg.m4

  ./configure --prefix=/usr \
              --disable-static
  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
