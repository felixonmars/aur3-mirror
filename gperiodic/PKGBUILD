# Maintainer: Shailendra Verma s_verma797@yahoo.in
pkgname=gperiodic
pkgver=2.0.10
pkgrel=1
pkgdesc="GPeriodic is a program for looking up data of elements from the Periodic Table."
url="http://www.frantz.fi/software/gperiodic.php"
license=('GPL')
depends=('gtk2')
arch=('i686' 'x86_64')
source=(http://www.frantz.fi/software/$pkgname-$pkgver.tar.gz)
md5sums=('9680f8a4850bdafad113fd4af7c57e45')

build() {
  cd $startdir/src/$pkgname-$pkgver

  # dirty trick to build
  # please create a patch and submit upstream
  # see: http://library.gnome.org/devel/gtk/unstable/gtk-migrating-tooltips.html
  # for more details
  sed -i 's;-DGTK_DISABLE_DEPRECATED;;' Makefile

  make || return 1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
