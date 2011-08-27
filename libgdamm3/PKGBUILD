# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

pkgname=libgdamm3
_pkgname=libgdamm
pkgver=3.0.1
pkgrel=2
pkgdesc="A C++ interface for libgda"
arch=(i686 x86_64)
depends=('libgda3' 'glibmm')
url="http://www.gtkmm.org/"
license=('LGPL')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/3.0/$_pkgname-$pkgver.tar.bz2)
md5sums=('63583ec970e643962474401400e19994')

build() {
  cd $startdir/src/$_pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
