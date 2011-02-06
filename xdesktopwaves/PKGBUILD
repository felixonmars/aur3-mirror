# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Stefan Husmann  <stefan-husmann@t-online.de>

pkgname=xdesktopwaves
pkgver=1.3
pkgrel=3
pkgdesc="xdesktopwaves is a cellular automata setting the background of your X Windows desktop under water."
url="http://xdesktopwaves.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxext')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz xdesktopwaves.desktop)
md5sums=('4ef1233527cb3bbf06b8fdc407b04ebe'
         '21263ff7b4fb8d804c7a1011ff84c63e')

build() { 
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  install -d $pkgdir/usr/bin || return 1
  mkdir -p $pkgdir/usr/share/man/man1
  make BINDIR=$pkgdir/usr/bin \
    MAN1DIR=$pkgdir/usr/share/man/man1 install || return 1
  install -Dm644 $pkgname.xpm \
    $pkgdir/usr/share/icons/$pkgname.xpm || return 1
  install -Dm644 ../$pkgname.desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop || return 1
}