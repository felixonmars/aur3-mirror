# Contributor: wabi
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=symon
pkgver=2.85
pkgrel=2
pkgdesc="symon is a system monitor for *BSD and Linux. It can be used to obtain accurate and up date information on the performance of a number of systems."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.xs4all.nl/~wpd/symon/"
depends=('rrdtool' 'bmake')
source=(http://www.xs4all.nl/~wpd/$pkgname/philes/$pkgname-$pkgver.tar.gz)
md5sums=('b69a935f5b166c200b58bd8f6d2ff97e')
  
build()
{
  cd $startdir/src/$pkgname
  bmake
  export PREFIX=$startdir/pkg/usr
  mkdir $startdir/pkg/usr
  mkdir $startdir/pkg/usr/bin
  bmake install
  chmod 755 $startdir/pkg/usr/man/man8
}
