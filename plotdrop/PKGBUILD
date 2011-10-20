# Contributor: Johannes Marbach (hennes) <jm@rapidrabbit.de>
pkgname=plotdrop
pkgver=0.5.3
pkgrel=1
pkgdesc="Plots datafiles (using gnuplot) by dragging them onto the GUI interface."
arch=('i686 x86_64')
url="http://icculus.org/~jcspray/plotdrop/"
license=('GPL')
depends=(gnuplot libglade glib2 gtk2)
source=("http://downloads.sourceforge.net/project/plotdrop/plotdrop-0.5.3.tar.gz")
md5sums=(8eaf3a8385832b15bb54dd6f435a3df6)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's|PREFIX=/usr/local|PREFIX=/usr|' Makefile || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  
  mkdir -pv $pkgdir/usr/man/man1 || return 1
  install -v -m 644 $pkgname.1 $pkgdir/usr/man/man1 || return 1
  gzip -9 -v $pkgdir/usr/man/man1/$pkgname.1 || return 1
}
