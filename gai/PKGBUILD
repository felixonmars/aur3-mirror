#contributor: benetnash<starbreaker@op.pl>
pkgname=gai
pkgver=0.5.10
pkgrel=1.1
pkgdesc="The General Applet Interface Library needed by several windowmaker applets"
url="http://gai.sourceforge.net/"
license="GPL"
depends=('sdl' 'gtk' 'pkgconfig')
source=(http://dl.sourceforge.net/sourceforge/gai/$pkgname-$pkgver.tar.bz2)
md5sums=('1c9cf2fb24ae6c95412c60f256dc3513')

build() {
  cd $startdir/src/$pkgname-$pkgver
  #patch configure - now X11 headers are elsewhere
  sed -i -e 's/\/usr\/X11R6\/include\/X11/\/usr\/include\/X11/g' configure
  ./configure --prefix=/usr
  #now patch a makefile - add -I/usr/include/freetype2 line
  sed -i -e 's/CFLAGS += -Wall -O2/CFLAGS \+= -Wall -O2 -I\/usr\/include\/freetype2\//' gai/Makefile
  make || return 1
  make DESTDIR=$startdir/pkg install
}

