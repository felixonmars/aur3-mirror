# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>

pkgname=muve
pkgver=0.8
pkgrel=1
pkgdesc="Command line tool for moving files to a portable MP3 player"
url="http://muve.sf.net"
depends=('perl')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('04aa739b5eb1080cbd663140e8fc904a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/man/man1
  cp muve.pl $startdir/pkg/usr/bin/
  chmod +x $startdir/pkg/usr/bin/muve.pl
  chown root:root $startdir/pkg/usr/bin/muve.pl
  cp muve.1.gz $startdir/pkg/usr/man/man1/
}
