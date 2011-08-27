# Contributor: Cristian Gimenez <kastor@fobos.org.ar>
pkgname=gnome-launch-box
pkgver=0.4
pkgrel=1
pkgdesc="Quicksilver like launcher"
url="http://developer.imendio.com/wiki/GNOME_Launch_Box"
depends=('evolution-data-server' 'gnome-menus' 'libgnomeui')
conflicts=()
backup=()
arch=('i686' 'x86_64')
license=('GPL')
install=
source=(http://ftp.imendio.com/pub/imendio/gnome-launch-box/src/$pkgname-$pkgver.tar.gz)
md5sums=('88f2eb08c959d48a61897ebc24b05fb2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  export PKG_CONFIG_PATH=/usr/lib/pkgconfig
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
