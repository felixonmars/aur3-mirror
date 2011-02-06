#Contributor: Kevin Edmonds <edmondskevin@hotmail.com>
pkgname=dpencoder
pkgver=0.6c
pkgrel=1
pkgdesc="application to easily encode DVD's into DivX files with an intuitive interface"
url="http://dpencoder.sourceforge.net/"
depends=('qt' 'perlqt' 'perl' 'libdvdread' 'mplayer')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('bd03c357b724a613e4784b2326423b77')
license="GPL"

build() {
  cd $startdir/src/$pkgname-$pkgver/DPencoder
  perl Makefile.PL PREFIX=/usr
  make || return 1
  make PREFIX=/usr DESTDIR=$startdir/pkg install
  find $startdir/pkg/usr/lib/ -name 'perllocal.pod' -exec rm  '{}' ';'
  rm -r $startdir/pkg/usr/lib/perl5/5.8.8/
}

