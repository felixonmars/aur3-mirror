# Maintainer Tomas Acauan Schertel <tschertel@gmail.com>
pkgname=qpspmanager
pkgver=2.0.2
pkgrel=3
pkgdesc="PBP file manager for Linux"
arch=('i686' 'x86_64')
depends=('qt' 'fontconfig')
url="http://qpspmanager.sourceforge.net"
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/qpspmanager/$pkgname-$pkgver.tar.gz
        qpspmanager.desktop)

md5sums=('b7e5df9fa51cf16386c0a94c1e9bb710'
         'f5fde7679df11a3b2fd523c25d5d9079')

build() {
  cd $srcdir/$pkgname-$pkgver
  qmake
  make || return 1
  make DESTDIR=$pkgdir/ install

  mkdir -p $pkgdir/usr/share/icons/
  install -D -m 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m 644 $srcdir/$pkgname-$pkgver/qpspmanager.ico $pkgdir/usr/share/icons/
  mkdir -p $pkgdir/usr/bin/
  install -D -m 755 $srcdir/$pkgname-$pkgver/bin/QPSPManager $pkgdir/usr/bin/
}
