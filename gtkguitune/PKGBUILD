# Contributor: totoloco <totoloco at gmx dot com>

pkgname=gtkguitune
pkgver=0.8
pkgrel=3
pkgdesc="Guitune is a linux program for tuning guitars and other instruments"
url="http://www.oocities.com/harpin_floh/kguitune_page.html"
license=('GPL2')
arch=(i686 x86_64)
depends=("gtk2" "gtkmm")
source=(gtkguitune.desktop http://www.oocities.com/harpin_floh/mysoft/gtkguitune-gtk2-0.8.tar.gz)
md5sums=("91332f4f6b15cc5d89f54804c7ccd610" "aeed6895e76af1fd0bce500fbe3e492a")

build() {
  cd $srcdir/$pkgname
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
  install -D -m644 $startdir/gtkguitune.desktop $pkgdir/usr/share/applications/gtkguitune.desktop
}

