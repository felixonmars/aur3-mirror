# Contributor: Cristian Gimenez <cgimenez@gmail.com>
pkgname=xpilot-ng
pkgver=4.7.3
pkgrel=1
pkgdesc="XPilot NG is a multi-player 2D spacewar game"
arch=('i686' 'x86_64')
license=('gpl')
url="http://xpilot.sourceforge.net/"
depends=('glibc' 'zlib' 'expat' 'sdl' 'sdl_ttf' 'sdl_image')
source=(http://ufpr.dl.sourceforge.net/sourceforge/xpilot/$pkgname-$pkgver.tar.gz)
md5sums=('89a360747f7811a33c4821eec5583b7d')

build() {
	  cd $startdir/src/$pkgname-$pkgver
         ./configure --prefix=/usr
          make || return 1
          make prefix=$startdir/pkg/usr install
}


