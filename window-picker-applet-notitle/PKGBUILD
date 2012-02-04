# Contributor: Nathan Dane <noz3001@gmail.com>
pkgname=window-picker-applet-notitle
pkgver=0.5.8
pkgrel=2
pkgdesc="Modified version of the window picker applet which only shows window icons on the panel"
arch=(i686 x86_64)
url="http://window-picker-applet-notitle.googlecode.com/"
license=('GPL')
source=(http://window-picker-applet-notitle.googlecode.com/files/window-picker-applet-notitle-0.5.8.tar.gz)
md5sums=('53a0224d5772599fed4850835244d56c')

build() {
     cd $startdir/src/$pkgname-$pkgver
     cd $srcdir/$pkgname-$pkgver
     ./configure --prefix=/usr
     make || return 1
     make DESTDIR=$pkgdir install || return 1
}

