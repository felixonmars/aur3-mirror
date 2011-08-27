# Contributor: William Rea <sillywilly@gmail.com>
pkgname=libsirius
pkgver=0.0.0
pkgrel=2
pkgdesc="A C++ library that interfaces to Sirius.com's stream interface"
arch=('i686' 'x86_64')
url="http://procyon.trolocsis.com"
license="LGPL"
depends=('curl' 'vlc' 'pcre')
source=(http://procyon.trolocsis.com/releases/libsirius-$pkgver.tar.gz)
md5sums=('94bd74319b02f6280db2f61874e6bff4')

build() {
  cd $startdir/src/libsirius-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --with-pcre=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

}
