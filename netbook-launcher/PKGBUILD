# Maintainer: noname

pkgname=netbook-launcher
pkgver=1.5.1
pkgrel=1
pkgdesc="the desktop-launcher which takes the place of Nautilus"
arch=(i686)
depends=('clutter' 'clutter-gtk')
url="https://edge.launchpad.net/~netbook-remix-team/+archive"
license=('GPL')
source=(https://edge.launchpad.net/%7Enetbook-remix-team/+archive/+files/netbook-launcher_1.5.1~ppa1.tar.gz)
md5sums=('1e4ae5f8a439480b7438c60759c86e97')
                                                      
build() {
  cd $startdir/src/netbook-remix-launcher
  cp -v $startdir/ubuntu.png $srcdir/netbook-remix-launcher/data
  ./configure --prefix=/usr || result 1
  make || result 1
  make install DESTDIR=$pkgdir || result 1
	}
