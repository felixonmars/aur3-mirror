# Contributor: <predrg@gmail.com>

pkgname=wmvolman
pkgver=1.0
pkgrel=3
pkgdesc="A small volume manager for Window Maker that handles hotpluggable devices and removable media using D-BUS and HAL."
arch=('i686' 'x86_64')
#url="http://www.dockapps.org/file.php/id/275"
url="http://dockapps.windowmaker.org/file.php/id/275"
license=('GPL')
groups=()
depends=('glib2' 'dbus-core' 'dbus-glib' 'libdockapp' 'udisks' 'libx11')
#source=(http://www.dockapps.org/download.php/id/851/$pkgname-$pkgver.tar.bz2)
source=(http://dockapps.windowmaker.org/download.php/id/851/wmvolman-$pkgver.tar.bz2 commit-c602e29)
md5sums=('1c16d364bd61480976c5e7850b8c49f3'
         'd05b99f8a1ae8f9610567bf4bc298ff7')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 < ../../commit-c602e29
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
