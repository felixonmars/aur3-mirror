pkgname=pmc
pkgver=2.700
pkgrel=1
pkgdesc="Mud client written in perl"
arch=('i686' 'x86_64')
depends=('perl-io-socket-ssl' 'perl-term-readkey' 'perl-term-readline-gnu')
license=('GPL')
source=(http://dl.sf.net/perlmudclient/$pkgname-$pkgver.tar.gz)
url="http://perlmudclient.sourceforge.net/"
md5sums=('bdc27d21371bc8529c3a5ac493d94cd9')
options=(docs)

build() {
  cd $startdir/src/$pkgname-$pkgver || return 1
  perl Makefile.PL || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  find $startdir/pkg -name "*.packlist" -delete || return 1
  find $startdir/pkg -name "*.pod" -delete || return 1
  rm -r $startdir/pkg/usr/lib || return 1
  mkdir -p $startdir/pkg/usr/share/doc/$pkgname || return 1
  install -Dm664 $startdir/src/$pkgname-$pkgver/README $startdir/pkg/usr/share/doc/$pkgname || return 1
  install -Dm664 $startdir/src/$pkgname-$pkgver/doc/* $startdir/pkg/usr/share/doc/$pkgname || return 1
}
