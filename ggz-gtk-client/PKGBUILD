# Contributor: dazzy

pkgname=ggz-gtk-client
pkgver=0.0.14.1
pkgrel=4
pkgdesc="GGZ Gaming Zone GTK+ client"
arch=('i686' 'x86_64')
url="http://www.ggzgamingzone.org/"
license=('GPL')

depends=('libggz' 'ggz-client-libs')
makedepends=()

source=(http://ftp.ggzgamingzone.org/pub/ggz/$pkgver/ggz-gtk-client-$pkgver.tar.gz
	props_c.patch
	xtext_c.patch)
md5sums=('87f67ff01f867bd04ba894a7c6a9f7fc'
	 '7dadc037fd2fc7cbe862eef35b63c7f3'
	 'f4057c599af89fc75b6527bf136efc67')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i "${srcdir}/props_c.patch"
  patch -Np1 -i "${srcdir}/xtext_c.patch"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-debug
  make || return 1
  make DESTDIR=$startdir/pkg install
}
